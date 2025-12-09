extends Node2D
signal collected

var in_evidence := false
@export var item_name := "knife"

func _on_area_2d_body_entered(body: Node2D):
	if body.is_in_group("player"):
		in_evidence = true

func _on_area_2d_body_exited(body: Node2D):
	if body.is_in_group("player"):
		in_evidence = false

func _physics_process(delta):
	if Input.is_action_just_pressed("pickup") and in_evidence:
		var inventory = get_node("/root/inventory")

		emit_signal("collected")

		# ------------------------------
		# Determine knife variant
		# ------------------------------
		var internal_name := ""

		if inventory.is_equipped("blood"):
			internal_name = "knife_bloody"
			print("Picked up KNIFE with blood equipped → internal: knife_bloody")
			inventory.remove_item("blood")   # remove one blood

		elif inventory.is_equipped("gloves"):
			internal_name = "knife_clean"
			print("Picked up KNIFE with gloves → internal: knife_clean")

		else:
			internal_name = "knife_tampered"
			print("Picked up KNIFE with bare hands → internal: knife_tampered")

		# ------------------------------
		# Add the final knife item
		# ------------------------------
		if inventory.add_item(internal_name):
			_set_ui_name_alias(inventory, internal_name, "knife")
			queue_free()
		else:
			print("Inventory full — cannot pick up knife.")
			
func _set_ui_name_alias(inventory, internal_name: String, display_name: String):
	if not inventory.has_meta("ui_alias"):
		inventory.set_meta("ui_alias", {})

	var alias = inventory.get_meta("ui_alias")
	alias[internal_name] = display_name
	inventory.set_meta("ui_alias", alias)
