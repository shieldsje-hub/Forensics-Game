extends Node2D
@onready var area_2d: Area2D = $line


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x -= delta * 50
	
	area_2d.visible = true

func _on_area_2d_area_shape_entered(_area_rid: RID, _area: Area2D, _area_shape_index: int, _local_shape_index: int) -> void:
	
	area_2d.visible = false
	queue_free()
