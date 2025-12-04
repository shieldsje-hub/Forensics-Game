extends Area2D
@onready var player: Node2D = $"../../Player"
@onready var player_control: CharacterBody2D = $"player control"



func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if player.dooropen:
		if player_control.direction:
			scale.x = -2.0
		else:
			scale.y = 2.0
	else:
		scale.x = 1.0
