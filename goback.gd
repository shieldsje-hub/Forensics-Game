extends Button

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("gobackmainpls") or button_pressed:
		get_tree().change_scene_to_file("res://mainmenu.tscn")
