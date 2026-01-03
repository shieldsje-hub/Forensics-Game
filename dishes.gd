extends Node2D

var in_evidence :bool = (false)

func _physics_process(_delta):
	if Input.is_action_just_pressed("pickup") and in_evidence and inventory.equipped_item == "gloves":
		var inv = get_node("/root/inventory")
		inv.add_item("dishes")
		queue_free()


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		in_evidence = true

func _on_area_2d_2_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		in_evidence = false
