extends RigidBody2D
@onready var old_knife: Node2D = $knife

func _on_knife_collected() -> void:
	queue_free()

func _ready():
	old_knife.connect("knife_collected", Callable(self, "_on_knife_collected"))

func _process(delta: float) -> void:
	if inventory.has_item("knife_clean") or inventory.has_item("knife_tampered") or inventory.has_item("knife_bloody") or inventory.has_item("knife"):
		queue_free()
