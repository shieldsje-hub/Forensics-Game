extends Node2D
@onready var label: Label = $Label
@onready var suspect_1: Button = $"suspect 1"
@onready var suspect_2: Button = $"suspect 2"
@onready var suspect_3: Button = $"suspect 3"
@onready var suspect_4: Button = $"suspect 4"
@onready var suspect_5: Button = $"suspect 5"
@onready var suspect_6: Button = $"suspect 6"
@onready var knife: Button = $evidence/knife
@onready var fiber: Button = $evidence/fiber
@onready var alibi: Button = $evidence/alibi
@onready var dishes: Button = $evidence/dishes
@onready var blood: Button = $evidence/blood


var suspect1select = bool(false)
var suspect2select = bool(false)
var suspect3select = bool(false)
var suspect4select = bool(false)
var suspect5select = bool(false)
var suspect6select = bool(false)
var suspectselected
var evidence_time = bool(false)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	buttons()



	
func buttons() ->void:
	if suspect1select:
		suspectselected = "Suspect 1"
	elif suspect2select:
		suspectselected = "suspect 2"
	elif suspect3select:
		suspectselected = "suspect 3"
	elif suspect4select:
		suspectselected = "suspect 4"
	elif suspect5select:
		suspectselected = "suspect 5"
	elif suspect6select:
		suspectselected = "suspect 6"
	
	
	
	
	
	if not (suspect1select or suspect2select or suspect3select or suspect4select or suspect5select or suspect6select):
		label.text = "Who do you want to prosecute?"
		if suspect_1.button_pressed:
			suspect1select = true
		if suspect_2.button_pressed:
			suspect2select = true
		if suspect_3.button_pressed:
			suspect3select = true
		if suspect_4.button_pressed:
			suspect4select = true
		if suspect_5.button_pressed:
			suspect5select = true
		if suspect_6.button_pressed:
			suspect6select = true
	else:
		suspect_1.visible = false
		suspect_1.disabled = true
		suspect_2.visible = false
		suspect_2.disabled = true
		suspect_3.visible = false
		suspect_3.disabled = true
		suspect_4.visible = false
		suspect_4.disabled = true
		suspect_5.visible = false
		suspect_5.disabled = true
		suspect_6.visible = false
		suspect_6.disabled = true
		evidence_time = true
	if evidence_time == true:
		label.text = "What evidence will you use to 
		prove " + suspectselected + " is guilty?"
		label.add_theme_font_size_override("font_size", 50)
		label.position.x = 170.0
		if inventory.has_item("knife"):
			knife.visible = true
			knife.disabled = false
		if (inventory.has_item("alibi1") and suspect1select) or (inventory.has_item("alibi2") and suspect2select) or (inventory.has_item("alibi3") and suspect3select) or (inventory.has_item("alibi4") and suspect4select) or (inventory.has_item("alibi5") and suspect5select) or (inventory.has_item("alibi6") and suspect6select):
			alibi.visible = true
			alibi.disabled = false
		if inventory.has_item("dishes"):
			dishes.visible = true
			dishes.disabled = false
		if inventory.has_item("fiber"):
			fiber.visible = true
			fiber.disabled = false
		if inventory.has_item("blood"):
			blood.visible = true
			blood.disabled = false
		
	
		
