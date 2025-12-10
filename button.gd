extends Button

var PLAY = bool(false)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PLAY = false # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if button_pressed or Input.is_action_just_pressed("gobackmainpls"):
		PLAY = true
	if PLAY:
		get_tree().change_scene_to_file("res://levels/Level2_Lab.tscn")
		PLAY = false
