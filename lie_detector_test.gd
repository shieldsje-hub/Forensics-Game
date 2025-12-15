extends Node2D
@onready var suspect_1b : Button = $"Node2D/suspect1 (chef1)"
@onready var suspect_2b : Button = $"Node2D/suspect2 (chef2)"
@onready var suspect_3b : Button = $"Node2D/suspect3 (chef3)"
@onready var suspect_4b : Button = $"Node2D/suspect4 (the kid)"
@onready var suspect_5b : Button = $"Node2D/suspect5 (the waitress)"
@onready var suspect_6b: Button = $"Node2D/suspect6 (the clerk)"

@onready var chef_1: Sprite2D = $Chef1
@onready var chef_2: Sprite2D = $Chef2
@onready var chef_3: Sprite2D = $Chef3
@onready var thekid: Sprite2D = $Thekid
var suspect1 = bool(false)
var suspect2 = bool(false)
var suspect3 = bool(false)
var suspect4 = bool(false)
var suspect5 = bool(false)
var suspect6 = bool(false)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if suspect_1b.button_pressed == true:
		chef_1.visible = true
		chef_2.visible = false
		chef_3.visible = false
		thekid.visible = false
		suspect1 = true
		suspect2 = false
		suspect3 = false
		suspect4 = false
		suspect5 = false
		suspect6 = false
	if suspect_2b.button_pressed == true:
		chef_1.visible = false
		chef_2.visible = true
		chef_3.visible = false
		thekid.visible = false
		suspect1 = false
		suspect2 = true
		suspect3 = false
		suspect4 = false
		suspect5 = false
		suspect6 = false
	if suspect_3b.button_pressed == true:
		chef_1.visible = false
		chef_2.visible = false
		chef_3.visible = true
		thekid.visible = false
		suspect1 = false
		suspect2 = false
		suspect3 = true
		suspect4 = false
		suspect5 = false
		suspect6 = false
	if suspect_4b.button_pressed == true:
		chef_1.visible = false
		chef_2.visible = false
		chef_3.visible = false
		thekid.visible = true
		suspect1 = false
		suspect2 = false
		suspect3 = false
		suspect4 = true
		suspect5 = false
		suspect6 = false
		
		if suspect1 == true or suspect2 == true or suspect3 == true or suspect4 == true or suspect5 == true or suspect6 == true:
			pass
		
		
		
		
		
		
		
		
		
		
		
		
