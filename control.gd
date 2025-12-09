extends Control

@onready var list = $Panel/VBoxContainer
@onready var equipped = $EquippedLabel

var inv

# --- ALIASES (INTERNAL → PLAYER NAME) ---
var aliases := {
	"knife_clean": "knife",
	"knife_tampered": "knife",
	"knife_bloody": "knife",
	"gloves": "gloves"  # normal items can map to themselves
}

func _ready():
	inv = get_node("/root/inventory")
	inv.connect("item_added", Callable(self, "_refresh"))
	inv.connect("item_equipped", Callable(self, "_show_equipped"))
	inv.connect("item_unequipped", Callable(self, "_clear_equipped"))
	_refresh()

func _input(event):
	if event.is_action_pressed("inventory"):
		visible = !visible

func _refresh(new_item = null):
	for c in list.get_children():
		c.queue_free()

	for internal_name in inv.items:
		var player_name = aliases.get(internal_name, internal_name)

		var b = Button.new()
		b.text = player_name

		b.connect("pressed", func():
			_on_item_pressed(internal_name)
		)

		list.add_child(b)

func _on_item_pressed(internal_name):
	if inv.is_equipped(internal_name):
		inv.unequip()
	else:
		inv.equip(internal_name)

func _show_equipped(internal_name):
	var player_name = aliases.get(internal_name, internal_name)
	equipped.text = "Equipped: " + player_name

func _clear_equipped():
	equipped.text = "Equipped: None"
