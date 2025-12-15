extends Node2D
var dooropen
var cargocan = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cargocan = false # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if cargocan and Input.is_action_just_pressed("pickup"):
		get_tree().change_scene_to_file("res://levels/Level2_Lab.tscn")
	if not inventory.has_item("clipboard"):
		inventory.add_item("clipboard")
	else:
		return



func _on_door_1_body_entered(body: Node2D) -> void:
	dooropen = true


func _on_door_1_body_exited(body: Node2D) -> void:
	dooropen = false


func _on_car_go_body_entered(body: Node2D) -> void:
	cargocan = true # Replace with function body.


func _on_car_go_body_exited(body: Node2D) -> void:
	cargocan = false # Replace with function body.
