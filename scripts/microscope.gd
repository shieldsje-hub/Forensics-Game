extends Node2D

@onready var spots := [
	$Spot1, $Spot2, $Spot3, $Spot4,
	$Spot5, $Spot6, $Spot7, $Spot8
]

var aliases := {
	"knife_clean": "knife",
	"knife_tampered": "knife",
	"knife_bloody": "knife",
	"gloves": "gloves",
	"blood": "blood",
	"fibre": "fibre"
}

var textures := {
	"fibre": preload("res://levels/bkvyrdhcar.png"),
}

func _ready():
	var inv = get_node("/root/inventory")
	inv.connect("item_added", _refresh)
	inv.connect("item_equipped", _refresh)
	inv.connect("item_unequipped", _refresh)
	_refresh()

func _refresh(_x = null):
	var inv = get_node("/root/inventory")
	var items = inv.get_items()

	for s in spots:
		s.texture = null
		s.visible = false
		if s.has_node("Button"):
			s.get_node("Button").visible = false

	var index := 0
	for internal in items:
		if index >= spots.size():
			break

		var spot = spots[index]
		var display = aliases.get(internal, internal)

		if display in textures:
			spot.texture = textures[display]
			spot.visible = true
		
		var button = spot.get_node("Button")
		button.visible = true
		button.pressed.connect(func(): _go_to_closeup(internal))

		index += 1


func _go_to_closeup(internal_name):
	inventory.equipped_item = internal_name
	print("went to closeup")
	get_tree().change_scene_to_file("res://levels/microscope2.tscn")
