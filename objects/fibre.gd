extends Node2D

signal collected(item_name)
var in_evidence
@export var item_name := "fibre"


func _on_area_2d_body_entered(body: Node2D):
	if body.is_in_group("player"):
		in_evidence = true
	
func _physics_process(delta):
	if Input.is_action_just_pressed("pickup") and in_evidence:
		var inv = get_node("/root/inventory")

		var final_name := ""
		if inv.is_equipped("gloves"):
			final_name = "fibre_clean"
		else:
			final_name = "fibre_tampered"

		if inv.add_item(final_name):
			inv.set_alias(final_name, "fibre")  # <— makes UI show “knife”
			queue_free()
