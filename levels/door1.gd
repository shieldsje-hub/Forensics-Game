extends Area2D

var can = bool(false)

func _process(_delta: float) -> void:
	pass
	if can:
		get_tree().change_scene_to_file("res://levels/u_sure.tscn")

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		can = false


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		can = true

func _on_area_2d_2_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		can = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		can = true
