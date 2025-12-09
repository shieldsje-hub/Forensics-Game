extends Node

var items: Array = []
var max_items := 20
var equipped_item: String = ""    

# UI references
var ui_list = null
var ui_equipped = null

signal item_added(item_name)
signal item_equipped(item_name)
signal item_unequipped()

# --------------------------------------------------
# Register UI
# --------------------------------------------------
func register_ui(list_node, equipped_label):
	ui_list = list_node
	ui_equipped = equipped_label
	_refresh_ui()

# --------------------------------------------------
# ITEM MANAGEMENT
# --------------------------------------------------
func add_item(item_name: String) -> bool:
	if items.size() >= max_items:
		return false

	items.append(item_name)
	emit_signal("item_added", item_name)
	_refresh_ui()
	return true

func remove_item(item_name: String):
	if item_name in items:
		items.erase(item_name)
	_refresh_ui()

func has_item(item_name: String) -> bool:
	return item_name in items

# --------------------------------------------------
# EQUIP SYSTEM
# --------------------------------------------------
func equip(item_name: String):
	if not (item_name in items):
		return

	if equipped_item == item_name:
		# UNEQUIP
		equipped_item = ""
		emit_signal("item_unequipped")
	else:
		# EQUIP
		equipped_item = item_name
		emit_signal("item_equipped", item_name)

	_refresh_ui()

func is_equipped(item_name: String) -> bool:
	return equipped_item == item_name

func unequip():
	equipped_item = ""
	emit_signal("item_unequipped")
	_refresh_ui()

# --------------------------------------------------
# UI
# --------------------------------------------------
func _refresh_ui():
	if ui_list == null:
		return

	# clear
	for c in ui_list.get_children():
		c.queue_free()

	# rebuild
	for item in items:
		var b = Button.new()
		b.text = item
		if is_equipped(item):
			b.text += "   (E)"

		b.connect("pressed", func():
			equip(item)
		)
		ui_list.add_child(b)

	if ui_equipped:
		ui_equipped.text = "Equipped: " + (equipped_item if equipped_item != "" else "None")

func get_display_name(internal_name: String) -> String:
	if has_meta("ui_alias"):
		var alias = get_meta("ui_alias")
		if internal_name in alias:
			return alias[internal_name]
	return internal_name
