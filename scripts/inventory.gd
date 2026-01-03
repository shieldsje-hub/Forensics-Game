extends Node

var items: Array[String] = []
var max_items := 20
var equipped_item: String = ""

var ui_list: VBoxContainer
var ui_equipped: Label

signal item_added(item_name)
signal item_equipped(item_name)
signal item_unequipped()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("secret"):
		inventory.add_item("knife_clean")
		inventory.add_item("blood")
		inventory.add_item("vial")
		inventory.add_item("gloves")
		inventory.add_item("fibre")
		inventory.add_item("Suspect 1 alibi")
		inventory.add_item("Suspect 2 alibi")
		inventory.add_item("Suspect 3 alibi")
		inventory.add_item("Suspect 4 alibi")
		inventory.add_item("Suspect 5 alibi")
		inventory.add_item("Suspect 6 alibi")

# ------------------------------------
# Register UI
# ------------------------------------
func register_ui(list_node: VBoxContainer, equipped_label: Label):
	ui_list = list_node
	ui_equipped = equipped_label
	_refresh_ui()

# ------------------------------------
# ITEM MANAGEMENT
# ------------------------------------
func add_item(id: String) -> bool:
	if items.size() >= max_items:
		return false

	items.append(id)
	emit_signal("item_added", id)
	_refresh_ui()
	return true

func remove_item(id: String):
	if id in items:
		items.erase(id)
	_refresh_ui()

func has_item(id: String) -> bool:
	return id in items

func get_items() -> Array[String]:
	return items

# ------------------------------------
# EQUIP SYSTEM
# ------------------------------------
func equip(id: String):
	if not (id in items):
		return

	if equipped_item == id:
		equipped_item = ""
		emit_signal("item_unequipped")
	else:
		equipped_item = id
		emit_signal("item_equipped", id)

	_refresh_ui()

func unequip():
	equipped_item = ""
	emit_signal("item_unequipped")
	_refresh_ui()

func is_equipped(id: String) -> bool:
	return equipped_item == id

# ------------------------------------
# UI
# ------------------------------------
func _refresh_ui():
	if ui_list == null:
		return

	for c in ui_list.get_children():
		c.queue_free()

	for internal_name in items:
		var display_name := get_display_name(internal_name)

		var b := Button.new()
		b.text = display_name + ("  (E)" if is_equipped(internal_name) else "")
		b.connect("pressed", func(): equip(internal_name))
		ui_list.add_child(b)

	if ui_equipped != null:
		ui_equipped.text = "Equipped: " + (get_display_name(equipped_item) if equipped_item != "" else "None")

# ------------------------------------
# ALIASES
# ------------------------------------
func get_display_name(internal_name: String) -> String:
	if has_meta("aliases"):
		var alias_map: Dictionary = get_meta("aliases")
		if internal_name in alias_map:
			return alias_map[internal_name]
	return internal_name

func set_alias(internal_name: String, display_name: String):
	if not has_meta("aliases"):
		set_meta("aliases", {})

	var alias_map: Dictionary = get_meta("aliases")
	alias_map[internal_name] = display_name
	set_meta("aliases", alias_map)

func count_item(id: String) -> int:
	var count := 0
	for itm in items:
		if itm == id:
			count += 1
	return count
