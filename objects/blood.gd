extends Node2D

signal item_collected(item_name)

@export var item_name := "blood"
@export var max_collects := 4
@export var required_item := "vial"   # <-- NEW

var in_evidence := false
var collected_count := 0
@onready var sprite: Sprite2D = $Sprite2D
@onready var inventory = get_node("/root/inventory")

func _ready():
	print("BloodSample ready")
	_update_fade()

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		in_evidence = true
		print("Player entered blood area")

func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		in_evidence = false
		print("Player left blood area")

func _physics_process(_delta):
	if in_evidence and Input.is_action_just_pressed("pickup"):
		_try_collect()

	# safety cleanup
	if collected_count >= max_collects:
		queue_free()

func _try_collect():
	print("Attempting blood collection...")

	if collected_count >= max_collects:
		print("Blood already fully collected")
		return

	if not inventory.has_item(required_item):
		print("❌ No vial available — cannot collect blood")
		return

	# consume vial
	inventory.remove_item(required_item)
	print("✔ Vial consumed")

	collected_count += 1
	inventory.add_item(item_name)
	emit_signal("item_collected", item_name)

	print("Collected blood piece:", collected_count)
	_update_fade()

	if collected_count >= max_collects:
		print("Blood sample exhausted")
		queue_free()

func _update_fade():
	var alpha := 1.0 - (float(collected_count) / max_collects)
	sprite.modulate.a = alpha
