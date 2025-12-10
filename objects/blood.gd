extends Node2D

signal item_collected(item_name)

@export var item_name := "blood"
@export var max_collects := 4

var in_evidence := false
var collected_count := 0   # <-- different name so no conflict!
var sprite

func _ready():
	sprite = $Sprite2D   # or whatever your sprite node is
	_update_fade()

func _on_area_2d_body_entered(body: Node2D):
	if body.is_in_group("player"):
		in_evidence = true

func _on_area_2d_body_exited(body: Node2D):
	in_evidence = false

func _physics_process(delta):
	if in_evidence and Input.is_action_just_pressed("pickup"):
		_collect_once()
	var inv = get_node("/root/inventory")

	if inv.count_item("blood") >= 4:
		queue_free() # remove the item so it can't respawn

		
func _collect_once():
	if collected_count >= max_collects:
		return
		
	collected_count += 1
	emit_signal("item_collected", item_name)
	print("Collected blood piece:", collected_count)

	_update_fade()
	inventory.add_item(item_name)

	if collected_count >= max_collects:
		queue_free()

func _update_fade():
	var alpha := 1.0 - (float(collected_count) / max_collects)
	sprite.modulate.a = alpha
