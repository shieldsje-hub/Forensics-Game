extends Control

@onready var big_sprite: Sprite2D = $ItemSprite
var gobak := false

var textures := {
	"knife_clean": preload("res://levels/preserved_knife(untampered).png"),
	"knife_tampered": preload("res://levels/tampered_knife(tampered).png"),
	"knife_bloody": preload("res://levels/bloodied_knife(tampered).png"),
	"knife": preload("res://ui/knife_clean.png"),
	"gloves": preload("res://levels/download.jpg"),
	"fibre": preload("res://levels/slidefiber.png"),
	"blood": preload("res://ui/vialofblood.png"),
	"clipboard": preload("res://ui/maybemainmenuscreenplaceholder.png"),
	"dishes": preload("res://dishes.png")
}

func _ready():
	var internal_name = inventory.equipped_item

	# SPECIAL CASE: open clipboard viewer
	if internal_name == "clipboard":
		get_tree().change_scene_to_file("res://levels/clipboardview.tscn")
		return
	# SPECIAL CASE: open clipboard viewer
	if internal_name == "blood":
		get_tree().change_scene_to_file("res://levels/blood_typing.tscn")
		return

	_show_item(internal_name)



func _show_item(internal_name):
	var tex = textures.get(internal_name, null)
	if tex == null:
		push_error("Missing texture for item: " + internal_name)
		return

	if big_sprite == null:
		push_error("Missing ItemSprite node!")
		return

	big_sprite.texture = tex

	if internal_name == "blood":
		big_sprite.scale = Vector2(0.5, 0.5)
	else:
		big_sprite.scale = Vector2(1, 1)


func _on_button_pressed():
	gobak = true

func _process(_delta):
	if gobak:
		get_tree().change_scene_to_file("res://tableinspectmode.tscn")

	if Input.is_action_just_pressed("gobackmainpls"):
		gobak = true
