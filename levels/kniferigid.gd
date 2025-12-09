extends RigidBody2D
@onready var old_knife: Node2D = $knife

func _on_knife_collected() -> void:
	queue_free()

func _ready():
	old_knife.connect("knife_collected", Callable(self, "_on_knife_collected"))
