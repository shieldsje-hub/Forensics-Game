extends Node2D

signal collected

var in_evidence := false

@export var item_name := "knife"

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		in_evidence = true

func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		in_evidence = false

func _physics_process(delta):
	if Input.is_action_just_pressed("pickup") and in_evidence:
		var inv = get_node("/root/inventory")

		var final_name := ""
		if inv.is_equipped("blood"):
			final_name = "knife_bloody"
			inv.remove_item("blood")
		elif inv.is_equipped("gloves"):
			final_name = "knife_clean"
		else:
			final_name = "knife_tampered"

		if inv.add_item(final_name):
			inv.set_alias(final_name, "knife")  # <— makes UI show “knife”
			queue_free()
