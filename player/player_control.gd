extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var node_2d: Node2D = $"../Node2D"
@onready var yes: Button = $"../Node2D/CanvasLayer/Yes"
@onready var no: Button = $"../Node2D/CanvasLayer/No"
var askingready = bool(false)
var can = bool(false)
var isready = bool(false)
@onready var courtdoor: Area2D = $"../../mappiecesbutlab/labwall1/courtdoor"
@onready var canvas_layer: CanvasLayer = $"../Node2D/CanvasLayer"

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if inventory.has_item("isghost"):
		modulate = Color(1.0, 1.0, 1.0, 0.196)
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("w") and is_on_floor() and not askingready:
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("a", "d")
	if direction and not askingready:
		velocity.x = lerp(velocity.x, direction * SPEED, delta * 8) 
		#scale.x = direction
	else:
		velocity.x = lerp(velocity.x, 0.0, delta * 8)
	if direction < 0:
		$players.flip_h = false
	elif direction > 0:
		$players.flip_h = true
	if Input.is_action_just_pressed("gobackmainpls"):
		get_tree().change_scene_to_file("res://mainmenu.tscn")
	move_and_slide()
	areyousurescreen()
func areyousurescreen() -> void:
	#if courtdoor.can and Input.is_action_just_pressed("pickup"):
		#node_2d.visible = true
		#askingready = true
	if Input.is_action_just_pressed("pickup") and isready:
		askingready = true
		canvas_layer.visible = true
	
		#elif no.button_pressed:
			#courtdoor.isready = false
			#askingready = false
			#node_2d.visible = false
	if yes.button_pressed:
		get_tree().change_scene_to_file("res://courtroom.tscn")
	if no.button_pressed:
		askingready = false
		canvas_layer.visible = false
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("courtdoor"):
		isready = true
		print("working")
	print("halfworking")


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("courtdoor"):
		isready = false
