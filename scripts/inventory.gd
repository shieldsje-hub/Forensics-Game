# inventory.gd
extends Node

var items: Array = []     # stores item names or item IDs
var max_items := 10       # optional: limit inventory size

func _process(delta: float) -> void:
	if inventory.has_item("knife"):
		print("Player already picked this up")


func add_item(item_name: String) -> bool:
	if items.size() >= max_items:
		return false # inventory full
	items.append(item_name)
	print("Added:", item_name)
	return true

func remove_item(item_name: String):
	if item_name in items:
		items.erase(item_name)
		print("Removed:", item_name)

func has_item(item_name: String) -> bool:
	return item_name in items
