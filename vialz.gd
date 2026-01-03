extends Area2D

signal picked_up

func _ready():
	print("Vial ready")

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		print("Vial picked up")
		emit_signal("picked_up")
		inventory.add_item("vial")
		queue_free()
