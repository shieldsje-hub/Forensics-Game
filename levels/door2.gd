extends Area2D

var can

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pickup") and can:
		get_tree().change_scene_to_file("res://lie_detector_test.tscn")


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		can = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		can = false
