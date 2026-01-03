extends Button

var OPTIONS = bool(false)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	OPTIONS = false # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if button_pressed:
		OPTIONS = true
	if OPTIONS:
		get_tree().change_scene_to_file("res://options.tscn")
		OPTIONS = false
