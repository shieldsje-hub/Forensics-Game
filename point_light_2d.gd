extends PointLight2D

var energychange = float(0.0)
var timer = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta * 20
	timer = clampf(timer, 0.0, 1.0)
	if timer == 1.0:
		timer = 0.0
		energychange = randf_range(8.0, 16.0)
	energy = lerp(energy, energychange, delta * 20)
