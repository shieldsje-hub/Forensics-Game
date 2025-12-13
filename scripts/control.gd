extends Control

@onready var big_sprite: Sprite2D = $ItemSprite
var gobak = false

var textures := {
	"knife_clean": preload("res://levels/preserved_knife(untampered).png"),
	"knife_tampered": preload("res://levels/tampered_knife(tampered).png"),
	"knife_bloody": preload("res://levels/bloodied_knife(tampered).png"),
	"knife": preload("res://ui/knife_clean.png"),
	"gloves": preload("res://levels/exitsign.png"),
	"fibre": preload("res://levels/slidefiber.png"),
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


func _on_button_pressed() -> void:
	gobak = true

func _process(_delta: float) -> void:
	if gobak == true:
		get_tree().change_scene_to_file("res://tableinspectmode.tscn")
	if Input.is_action_just_pressed("gobackmainpls"):
		gobak = true
