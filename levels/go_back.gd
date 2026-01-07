extends Area2D
var go
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		go = true
	if go:
		get_tree().change_scene_to_file("res://levels/Level1_CrimeScene.tscn")
