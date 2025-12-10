extends Node2D

@onready var image_display := $Sprite2D
var in_range := false

func _process(delta):
	if in_range and Input.is_action_just_pressed("pickup"):
		get_tree().change_scene_to_file("res://tableinspectmode.tscn")

func _show_knife():
	var inv = get_node("/root/inventory")

	# If nothing equipped → reset table image
	if inv.equipped_item == "" or inv.equipped_item == null or inv.equipped_item == "blood":
		print(image_display.scale)
		image_display.texture = load("res://ui/default_table.png") # <— replace with your default image
		print("No item equipped → resetting table.")
		image_display.scale.x = 0.125
		image_display.scale.y = 0.168

		return

	# Must have knife equipped
	if not inv.equipped_item.begins_with("knife"):
		image_display.texture = load("res://ui/default_table.png") # reset again if it's not a knife
		print("Knife not equipped → resetting table.")
		return

	var knife_type = inv.equipped_item

	match knife_type:
		"knife_clean":
			image_display.texture = load("res://ui/knife_clean.png")
			image_display.scale.x = 1
			image_display.scale.y = 1
		"knife_bloody":
			image_display.texture = load("res://ui/knife_bloody.png")
			image_display.scale.x = 1
			image_display.scale.y = 1
		"knife_tampered":
			image_display.texture = load("res://ui/knife_tampered.png")
			image_display.scale.x = 1
			image_display.scale.y = 1
		_:
			print("Unexpected knife variant!")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		in_range = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		in_range = false
