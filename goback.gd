extends Button
var go_back = false #Variable allows to have button or esc

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("gobackmainpls") or button_pressed:
		go_back = true



	if go_back == true:
		get_tree().change_scene_to_file("res://mainmenu.tscn")
