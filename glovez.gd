extends Area2D

signal picked_up

func _ready():
	print("Gloves ready")

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		print("Gloves picked up")
		emit_signal("picked_up")
		inventory.add_item("gloves")
		queue_free()
