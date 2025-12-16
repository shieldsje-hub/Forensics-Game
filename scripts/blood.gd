extends Node2D

@onready var hint_text: Label = $UI/HintText
@onready var finish_button: Button = $UI/FinishButton
@onready var blood_sample: Node2D = $BloodSample

var gobak
var reactions_done := 0
const TOTAL_REACTIONS := 3

func _ready():

	# UI
	hint_text.text = "Drag the blood sample into each serum. They will turn darker if they react, and will be blue to more easily show not reacting so you dont think the game is broken"
	finish_button.disabled = true
	finish_button.pressed.connect(_on_finish_button_pressed)

	# Consume blood item
	if inventory.has_item("blood"):
		inventory.remove_item("blood")
	else:
		print("No blood sample in inventory! Closing test.")
		queue_free()

func register_reaction():
	reactions_done += 1
	if reactions_done >= TOTAL_REACTIONS:
		hint_text.text = "All reactions observed!"
		finish_button.disabled = false

func _on_finish_button_pressed() -> void:
	print("Blood typing test finished!")
	# Optional: add a report item to inventory
	# Inventory.add_item("blood_report", "res://icons/blood_report.png")
	gobak = true
	queue_free()

func _process(_delta: float) -> void:
	if gobak == true:
		get_tree().change_scene_to_file("res://levels/Level2_Lab.tscn")
	if Input.is_action_just_pressed("gobackmainpls"):
		gobak = true
