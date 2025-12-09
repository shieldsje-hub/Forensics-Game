extends Area2D
@onready var light_right: PointLight2D = $"../light_right"
@onready var light_left: PointLight2D = $"../light_left"
@onready var light_middle: PointLight2D = $"../light_middle"
var timer = 2.0
var lights_on = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	light_left.energy = 0.0 # Replace with function body.
	light_right.energy = 0.0
	light_middle.energy = 0.0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if lights_on:
		timer -= delta
	timer = clampf(timer, 0.0, 2.0)
	if timer == 0.0:
		light_left.energy = lerp(light_left.energy, 3.5, delta)
		light_middle.energy = lerp(light_middle.energy, 3.5, delta)
		light_right.energy = lerp(light_right.energy, 3.5, delta)
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		lights_on = true
		timer = 2.0
