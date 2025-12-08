extends Area2D

@onready var player := get_tree().get_nodes_in_group("player")[0]


func _ready() -> void:
	visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		visible = true



func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		visible = false
