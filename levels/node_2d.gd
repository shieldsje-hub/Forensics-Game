extends Node2D
@onready var car: Sprite2D = $Goodcarmade3Dbutnotreally
var hit = bool(false)
@onready var canvas_modulate: CanvasModulate = $"../CanvasModulate"
var timerstart = float(0.0)
@onready var deadbody: Sprite2D = $Deadbody
@onready var player: Node2D = $"../Player"
var cantdietwice = bool(false)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if hit:
		canvas_modulate.color = Color(0.0, 0.0, 0.0, 1.0)
		hit = false
		timerstart = 1.0
		car.visible = true
		deadbody.visible = true
		inventory.add_item("isghost")
	if inventory.has_item("isghost"):
		cantdietwice = true
		deadbody.visible = true
		car.visible = true
	
	timerstart -= delta 
	timerstart = clampf(timerstart, 0.0, 1.0)
	if timerstart == 0.0:
		canvas_modulate.color = lerp(canvas_modulate.color, Color(1.0, 1.0, 1.0, 1.0), delta/3)
func _on_carhitplayer_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if not cantdietwice:
			hit = true
			cantdietwice = true
	
