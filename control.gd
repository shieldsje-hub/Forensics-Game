extends Control

@onready var box := $VBoxContainer

func _process(delta):
	box.clear()
	for item in inventory.items:
		var label = Label.new()
		label.text = item
		box.add_child(label)
