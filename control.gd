extends Control

@onready var list: VBoxContainer = $Panel/VBoxContainer
@onready var equipped: Label = $EquippedLabel

var inv: Node

# Explicit dictionary type to avoid Variant warnings
var aliases: Dictionary = {
	"knife_clean": "knife",
	"knife_tampered": "knife",
	"knife_bloody": "knife",
	"gloves": "gloves"
}

func _ready() -> void:
	inv = get_node("/root/inventory")

	inv.connect("item_added", Callable(self, "_refresh"))
	inv.connect("item_equipped", Callable(self, "_show_equipped"))
	inv.connect("item_unequipped", Callable(self, "_clear_equipped"))

	_refresh()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("inventory"):
		visible = !visible


func _refresh(new_item := "") -> void:
	# Clear old buttons
	for c in list.get_children():
		c.queue_free()

	# Rebuild inventory list
	for internal_name: String in inv.items:
		var player_name: String = aliases.get(internal_name, internal_name)

		var b := Button.new()
		b.text = player_name

		b.connect("pressed", func():
			_on_item_pressed(internal_name)
		)

		list.add_child(b)


func _on_item_pressed(internal_name: String) -> void:
	if inv.is_equipped(internal_name):
		inv.unequip()
	else:
		inv.equip(internal_name)


func _show_equipped(internal_name: String) -> void:
	var player_name: String = aliases.get(internal_name, internal_name)
	equipped.text = "Equipped: " + player_name


func _clear_equipped() -> void:
	equipped.text = "Equipped: None"
