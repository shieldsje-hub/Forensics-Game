extends Node2D

signal collected(item_name)
var in_evidence
@export var item_name := "knife"
var collectede = false
func _ready() -> void:
	collectede = false
func _on_area_2d_body_entered(body: Node2D):
	if body.is_in_group("player"):
		in_evidence = true
	
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("pickup") and in_evidence:
		collectede = true
		emit_signal("collected", item_name)
		print("knife")
		if inventory.add_item(item_name):
			queue_free() # remove item from world
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	in_evidence = false

func _physics_process(delta):
	if Input.is_action_just_pressed("pickup") and in_evidence:
		var inventory = get_node("/root/inventory")

		# Decide internal name
		var internal_name := ""

		if inventory.is_equipped("gloves"):
			internal_name = "knife_clean"
			print("Picked up knife (gloves on) → stored as knife_clean")
		else:
			internal_name = "knife_tampered"
			print("Picked up knife (bare hands) → stored as knife_tampered")

		# Add internal item
		if inventory.add_item(internal_name):
			# But add a UI alias so the player always sees "knife"
			_set_ui_name_alias(inventory, internal_name, "knife")

			queue_free()

# ----------------------------------------------------
# Assigns what text should show in UI for a given item
# ----------------------------------------------------
func _set_ui_name_alias(inventory, internal_name: String, display_name: String):
	# store alias table inside inventory if not present
	if not inventory.has_meta("ui_alias"):
		inventory.set_meta("ui_alias", {})

	var alias = inventory.get_meta("ui_alias")
	alias[internal_name] = display_name
	inventory.set_meta("ui_alias", alias)
