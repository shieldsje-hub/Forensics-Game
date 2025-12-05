extends Area2D

@onready var player: Node2D = $"../../Player"

@onready var playerco := get_tree().get_nodes_in_group("player")[0]


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if player.dooropen:
		if playerco.direction:
			scale.x = -2.0
		else:
			scale.y = 2.0
	else:
		scale.x = 1.0
