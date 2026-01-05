extends Node2D
var bak


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://courtroom.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://lie_detector_test.tscn")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("gobackmainpls"):
		bak = true
	if bak:
		get_tree().change_scene_to_file("res://levels/Level2_Lab.tscn")


func _on_button_3_pressed() -> void:
	bak = true
