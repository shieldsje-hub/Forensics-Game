extends Node2D

@export var inventory: Node = null
var slot_nodes: Array = []

func _ready():
	# Cache all Sprite2D children as "slots"
	for c in get_children():
		if c is Sprite2D:
			slot_nodes.append(c)

	update_slots()

func update_slots():
	if inventory == null:
		return

	var items = inventory.get_items()

	# Loop through all 8 slots
	for i in range(slot_nodes.size()):
		var slot = slot_nodes[i]

		if i < items.size():
			var item = items[i]
			var icon_path = item["icon"]

			# Load icon and show it
			slot.texture = load(icon_path)
			slot.visible = true
		else:
			# No item for this slot
			slot.texture = null
			slot.visible = false
