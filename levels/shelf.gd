extends Node2D

var in_range

func _physics_process(_delta: float) -> void:
	if in_range and Input.is_action_just_pressed("pickup"):
		get_tree().change_scene_to_file("res://shelf.tscn")
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		in_range = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		in_range = false
