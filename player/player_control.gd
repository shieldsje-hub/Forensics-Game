extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("w") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("a", "d")
	if direction:
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
	
