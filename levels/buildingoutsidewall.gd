extends Area2D

@onready var player := get_tree().get_nodes_in_group("player")[0]
@onready var light1: PointLight2D = $"../PointLight2D"
@onready var light2: PointLight2D = $"../PointLight2D2"
var opacitygo = bool(false)

func _ready() -> void:
	visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if opacitygo:
		modulate = lerp(modulate, Color(1.0, 1.0, 1.0, 0.0), delta * 2)
		light1.energy = lerp(light1.energy, 12.41, delta * 2)
		light2.energy = lerp(light2.energy, 12.41, delta * 2)
	else:
		modulate = lerp(modulate, Color(1.0, 1.0, 1.0, 1.0), delta * 3)
		light1.energy = lerp(light1.energy, 2.5, delta * 3)
		light2.energy = lerp(light2.energy, 2.5, delta * 3)
	
	

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		opacitygo = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		opacitygo = false
