extends Area2D

signal picked_up
var novial = inventory.count_item("vial")

func _ready():
	print("Vial ready")

func _process(_delta: float) -> void:
	if novial >= 4:
		queue_free()
		

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		print("Vial picked up")
		emit_signal("picked_up")
		inventory.add_item("vial")
		queue_free()
