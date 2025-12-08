extends RigidBody2D
@onready var knife: Node2D = $knife



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(-900.0, -40.0) # Replace with function body.
	freeze = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if knife.in_evidence == true and Input.is_action_just_pressed("pickup"):
		position = Vector2(0.0, -1000.0)
		freeze = true
	
