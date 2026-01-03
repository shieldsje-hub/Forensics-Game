extends Area2D

@onready var player := get_tree().get_nodes_in_group("player")[0]
@onready var sprite: Sprite2D = $"../door1/door1s"
@onready var sprite2: Sprite2D = $"../door2/door2s"

var work = bool(false)
var work2 = bool(false)
func _ready() -> void:
	pass
func _process(_delta: float):
	if work:
		if player.velocity.x < 0.0:
			sprite.scale.y = 0.2
			sprite.position.x = -10.0
		if player.velocity.x > 0.0:
			sprite.scale.y = -0.2
			sprite.position.x = 10.0
	if work2:
		if player.velocity.x < 0.0:
			sprite2.scale.y = 0.2
			sprite2.position.x = -10.0
		if player.velocity.x > 0.0:
			sprite2.scale.y = -0.2
			sprite2.position.x = 10.0


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		work = true
		work2 = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		work = false
		work2 = false
		sprite.scale.y = 0.092
		sprite.position.x = 0.0
		sprite2.scale.y = 0.092
		
		#sprite2.scale.y = 0.092

func _on_door_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		work2 = true

func _on_door_2_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		sprite2.scale.y = 0.092
		sprite2.position.x = 0.0
		work2 = false
