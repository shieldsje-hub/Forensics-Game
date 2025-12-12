extends Control

@onready var big_sprite: Sprite2D = $ItemSprite

var textures := {
	"knife_clean": preload("res://levels/preserved_knife(untampered).png"),
	"knife_tampered": preload("res://levels/tampered_knife(tampered).png"),
	"knife_bloody": preload("uid://bawuxx2rqlaa8"),
	"knife": preload("res://ui/knife_clean.png"),
	"gloves": preload("res://levels/exitsign.png"),
	"fibre": preload("res://levels/bkvyrdhcar.png"),
	"blood": preload("res://ui/vialofblood.png")
}
 
func _ready():
	var internal_name = inventory.equipped_item
	_show_item(internal_name)


func _show_item(internal_name):
	var tex = textures.get(internal_name, null)

	if tex == null:
		push_error("Missing texture for item: " + internal_name)
		return

	big_sprite.texture = tex

	if internal_name == "blood":
		big_sprite.scale = Vector2(0.5, 0.5)
	else:
		big_sprite.scale = Vector2.ONE
