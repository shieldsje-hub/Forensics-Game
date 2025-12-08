extends Area2D

@onready var player := get_tree().get_nodes_in_group("player")[0]
@onready var light1: PointLight2D = $"../PointLight2D"
@onready var light2: PointLight2D = $"../PointLight2D2"
var opacitygo

func _ready() -> void:
	visible


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if opacitygo:
		modulate = lerp(modulate, Color(1.0, 1.0, 1.0, 0.0), delta * 1.5)
		light1.energy = lerp(light1.energy, 12.41, delta * 1.5)
		light2.energy = lerp(light2.energy, 12.41, delta * 1.5)
	else:
		modulate = lerp(modulate, Color(1.0, 1.0, 1.0, 1.0), delta * 3)
		light1.energy = lerp(light1.energy, 2.5, delta * 1.5)
		light2.energy = lerp(light2.energy, 2.5, delta * 1.5)
	print(self_modulate)
	

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		#visible = false
		#light1.visible = true
		#light2.visible = true
		opacitygo = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		#visible = true
		#light1.visible = false
		#light2.visible = false
		opacitygo = false
