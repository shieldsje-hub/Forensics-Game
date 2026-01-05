extends Area2D

signal picked_up
var maxgloves = inventory.count_item("gloves")

func _ready():
	print("Gloves ready")

func _input_event(_viewport, event, _shape_idx):
	if maxgloves >= 1:
		queue_free()
	if event is InputEventMouseButton and event.pressed:
		print("Gloves picked up")
		emit_signal("picked_up")
		inventory.add_item("gloves")
		queue_free()
