extends Node2D

signal collected(item_name)
var in_evidence
@export var item_name := "fibre"


func _on_area_2d_body_entered(body: Node2D):
	if body.is_in_group("player"):
		in_evidence = true
	
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("pickup") and in_evidence:
		emit_signal("collected", item_name)
		print("fibre")
		if inventory.add_item(item_name):
			queue_free() # remove item from world

func _on_area_2d_body_exited(body: Node2D) -> void:
	in_evidence = false
