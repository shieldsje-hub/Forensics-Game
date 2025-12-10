extends Node2D

# grab the 8 sprite spots
@onready var spots := [
	$Spot1, $Spot2, $Spot3, $Spot4,
	$Spot5, $Spot6, $Spot7, $Spot8
]

# internal → visible name
var aliases := {
	"knife_clean": "knife",
	"knife_tampered": "knife",
	"knife_bloody": "knife",
	"gloves": "gloves",
	"blood": "blood",
	"fibre": "fibre"
}

# map visible names to textures
var textures := {
	"knife": preload("res://ui/knife_clean.png"),
	"fibre": preload("res://levels/bkvyrdhcar.png"),
	"gloves": preload("res://levels/download.jpg"),
	"blood": preload("res://levels/blood_splatter-removebg-preview.png"),
	"knife_tampered":preload("uid://dtbdugx1y42ov"),
	"knife_bloody": preload("uid://bawuxx2rqlaa8")}
	

func _ready():
	var inv = get_node("/root/inventory")
	inv.connect("item_added", Callable(self, "_refresh"))
	inv.connect("item_equipped", Callable(self, "_refresh"))
	inv.connect("item_unequipped", Callable(self, "_refresh"))
	_refresh()

func _refresh(_junk = null):
	var inv = get_node("/root/inventory")
	var items: Array = inv.get_items()

	# Clear all spots
	for s in spots:
		s.texture = null
		s.visible = false

	var index := 0

	for internal_name in items:
		if index >= spots.size():
			break

		var visual_name = internal_name
		if internal_name in aliases:
			visual_name = aliases[internal_name]

		if visual_name in textures:
			spots[index].texture = textures[visual_name]
			spots[index].visible = true

		index += 1
