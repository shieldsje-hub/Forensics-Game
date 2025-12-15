extends Control

@onready var page_texture: TextureRect = $PageTexture
@onready var next_button: Button = $NextButton
@onready var prev_button: Button = $PrevButton

# All clipboard pages (add more as needed)
var pages := [
	preload("res://ui/knife_bloody.png"),
	preload("res://ui/knife_clean.png"),
	preload("res://ui/knife_tampered.png")
]

var current_page := 0

func _ready():
	_update_page()

func _update_page():
	page_texture.texture = pages[current_page]
	prev_button.disabled = current_page == 0
	next_button.disabled = current_page == pages.size() - 1




func _input(event):
	# ESC or your custom input → go back to table
	if event.is_action_pressed("gobackmainpls"):
		get_tree().change_scene_to_file("res://tableinspectmode.tscn")


func _on_prev_button_pressed() -> void:
	if current_page > 0:
		current_page -= 1
	_update_page()


func _on_next_button_pressed() -> void:
	if current_page < pages.size() - 1:
		current_page += 1
	_update_page()
