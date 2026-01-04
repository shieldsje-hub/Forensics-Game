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
@onready var label_2: Label = $Label2
@onready var finish: Button = $finish
var win = bool(false)
var lose = bool(false)
var evidencestart = bool(false)
var winpercentage = float(0.0)
var suspect1select = bool(false)
var suspect2select = bool(false)
var suspect3select = bool(false)
var suspect4select = bool(false)
var suspect5select = bool(false)
var suspect6select = bool(false)
var suspectselected = str("")
var evidence_time = bool(false)
var talking = bool(false)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if finish.button_pressed:
		if randf_range(0.0, 100.0) <= winpercentage:
			if suspect2select:
				talking = true
				label.text = "You won! the murderer was proven guilty!"
				label.visible_ratio = 0.0
			else:
				talking = true
				label.text = "you won the court case! but sent an innocent citizen to jail..."
				label.visible_ratio = 0.0
		else:
			talking = true
			label.text = "you lost the court case and the murderer walks free."
			label.visible_ratio = 0.0
		finish.visible = false
		finish.disabled = true
			
	if talking:
		label.add_theme_font_size_override("font_size", 35)
		label.visible_ratio += (delta/label.get_total_character_count()) * 16
		if Input.is_action_just_pressed("next"):
			if label.visible_ratio == 1.0:
				talking = false
				label.text = "What evidence will you use to 
				prove " + suspectselected + " is guilty?"
				label.add_theme_font_size_override("font_size", 50)
			else:
				label.visible_ratio = 1.0
	winpercentage = clampf(winpercentage, 0.0, 100.0)
	label_2.text = "Juror favor::
	" + str(winpercentage)  + "%"
	
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
	if evidence_time == true and not talking and not evidencestart:
		finish.visible = true
		finish.disabled = false
		label.text = "What evidence will you use to 
		prove " + suspectselected + " is guilty?"
		label.add_theme_font_size_override("font_size", 50)
		label.position.x = 170.0
		if inventory.has_item("knife_clean") or inventory.has_item("knife_bloody") or inventory.has_item("knife_tampered"):
			knife.visible = true
			knife.disabled = false
		if (inventory.has_item("Suspect 1 alibi") and suspect1select) or (inventory.has_item("Suspect 2 alibi") and suspect2select) or (inventory.has_item("Suspect 3 alibi") and suspect3select) or (inventory.has_item("Suspect 4 alibi") and suspect4select) or (inventory.has_item("Suspect 5 alibi") and suspect5select) or (inventory.has_item("Suspect 6 alibi") and suspect6select):
			alibi.visible = true
			alibi.disabled = false
		if inventory.has_item("dishes"):
			dishes.visible = true
			dishes.disabled = false
		if inventory.has_item("fibre"):
			fiber.visible = true
			fiber.disabled = false
		if inventory.has_item("blood"):
			blood.visible = true
			blood.disabled = false
		
		evidencestart = true
	if evidence_time:
		if suspect1select:
			if knife.button_pressed:
				if inventory.has_item("knife_clean"):
					winpercentage += 20.0
					knife.disabled = true
					talking = true
					label.text = "Fingerprints found on knife match the suspect!"
					label.visible_ratio = 0.0
				else:
					winpercentage -= 25.0
					knife.disabled = true
					talking = true
					label.text = "Knife has been tampered with! The evidence is rendered irrelevant!"
					label.visible_ratio = 0.0
			if fiber.button_pressed:
				winpercentage += 20.0
				fiber.disabled = true
				talking = true
				label.text = "Fibers match the clothing Suspect was wearing!"
				label.visible_ratio = 0.0
			if dishes.button_pressed:
				winpercentage -= 10.0
				dishes.disabled = true
				talking = true
				label.text = "What does this have to do with the case?!"
				label.visible_ratio = 0.0
			if alibi.button_pressed:
				winpercentage -= 20.0
				alibi.disabled = true
				talking = true
				label.text = "The alibi was confirmed to be true!"
				label.visible_ratio = 0.0
			if blood.button_pressed:
				winpercentage += -10.0
				blood.disabled = true
				talking = true
				label.text = "the blood type doesn't match!"
				label.visible_ratio = 0.0
		elif suspect2select:
			if knife.button_pressed:
				if inventory.has_item("knife_clean"):
					winpercentage += 20.0
					knife.disabled = true
					talking = true
					label.text = "Fingerprints found on knife match the suspect!"
					label.visible_ratio = 0.0
				else:
					winpercentage -= 25.0
					knife.disabled = true
					talking = true
					label.text = "Knife has been tampered with! The evidence is rendered irrelevant!"
					label.visible_ratio = 0.0
			if fiber.button_pressed:
				winpercentage += 20.0
				fiber.disabled = true
				talking = true
				label.text = "Fibers match the clothing Suspect was wearing!"
				label.visible_ratio = 0.0
			if dishes.button_pressed:
				winpercentage -= 10.0
				dishes.disabled = true
				talking = true
				label.text = "What does this have to do with the case?!"
				label.visible_ratio = 0.0
			if alibi.button_pressed:
				winpercentage += 40.0
				alibi.disabled = true
				talking = true
				label.text = "The alibi was confirmed to be false!"
				label.visible_ratio = 0.0
			if blood.button_pressed:
				winpercentage += 20.0
				blood.disabled = true
				talking = true
				label.text = "the blood type matches!"
				label.visible_ratio = 0.0
		elif suspect3select:
			if knife.button_pressed:
				if inventory.has_item("knife_clean"):
					winpercentage += 20.0
					knife.disabled = true
					talking = true
					label.text = "Fingerprints found on knife match the suspect!"
					label.visible_ratio = 0.0
				else:
					winpercentage -= 25.0
					knife.disabled = true
					talking = true
					label.text = "Knife has been tampered with! The evidence is rendered irrelevant!"
					label.visible_ratio = 0.0
			if fiber.button_pressed:
				winpercentage += 20.0
				fiber.disabled = true
				talking = true
				label.text = "Fibers match the clothing Suspect was wearing!"
				label.visible_ratio = 0.0
			if dishes.button_pressed:
				winpercentage -= 10.0
				dishes.disabled = true
				talking = true
				label.text = "What does this have to do with the case?!"
				label.visible_ratio = 0.0
			if alibi.button_pressed:
				winpercentage -= 20.0
				alibi.disabled = true
				talking = true
				label.text = "The alibi was confirmed to be true!"
				label.visible_ratio = 0.0
			if blood.button_pressed:
				winpercentage += -10.0
				blood.disabled = true
				talking = true
				label.text = "the blood type doesn't match!"
				label.visible_ratio = 0.0
		elif suspect4select:
			if knife.button_pressed:
				if inventory.has_item("knife_clean"):
					winpercentage += 20.0
					knife.disabled = true
					talking = true
					label.text = "Fingerprints found on knife match the suspect!"
					label.visible_ratio = 0.0
				else:
					winpercentage -= 25.0
					knife.disabled = true
					talking = true
					label.text = "Knife has been tampered with! The evidence is rendered irrelevant!"
					label.visible_ratio = 0.0
			if fiber.button_pressed:
				winpercentage -= 10.0
				fiber.disabled = true
				talking = true
				label.text = "Fibers do not match the clothing Suspect was wearing!"
				label.visible_ratio = 0.0
			if dishes.button_pressed:
				winpercentage -= 10.0
				dishes.disabled = true
				talking = true
				label.text = "What does this have to do with the case?!"
				label.visible_ratio = 0.0
			if alibi.button_pressed:
				winpercentage -= 20.0
				alibi.disabled = true
				talking = true
				label.text = "The alibi was confirmed to be true!"
				label.visible_ratio = 0.0
			if blood.button_pressed:
				winpercentage += 20.0
				blood.disabled = true
				talking = true
				label.text = "the blood type matches!"
				label.visible_ratio = 0.0
		elif suspect5select:
			if knife.button_pressed:
				if inventory.has_item("knife_clean"):
					winpercentage -= 10.0
					knife.disabled = true
					talking = true
					label.text = "Fingerprints found on knife match the suspect! except they are several weeks old."
					label.visible_ratio = 0.0
				else:
					winpercentage -= 25.0
					knife.disabled = true
					talking = true
					label.text = "Knife has been tampered with! The evidence is rendered irrelevant!"
					label.visible_ratio = 0.0
			if fiber.button_pressed:
				winpercentage -= 10.0
				fiber.disabled = true
				talking = true
				label.text = "Fibers do not match the clothing Suspect was wearing!"
				label.visible_ratio = 0.0
			if dishes.button_pressed:
				winpercentage -= 10.0
				dishes.disabled = true
				talking = true
				label.text = "What does this have to do with the case?!"
				label.visible_ratio = 0.0
			if alibi.button_pressed:
				winpercentage -= 20.0
				alibi.disabled = true
				talking = true
				label.text = "The alibi was confirmed to be true!"
				label.visible_ratio = 0.0
			if blood.button_pressed:
				winpercentage += 20.0
				blood.disabled = true
				talking = true
				label.text = "the blood type matches!"
				label.visible_ratio = 0.0
		elif suspect6select:
			if knife.button_pressed:
				if inventory.add_item("knife_clean"):
					winpercentage += -10.0
					knife.disabled = true
					talking = true
					label.text = "Fingerprints found on knife do not match the suspect!"
					label.visible_ratio = 0.0
				else:
					winpercentage -= 25.0
					knife.disabled = true
					talking = true
					label.text = "Knife has been tampered with! The evidence is rendered irrelevant!"
					label.visible_ratio = 0.0
			if fiber.button_pressed:
				winpercentage += 20.0
				fiber.disabled = true
				talking = true
				label.text = "Fibers match the clothing Suspect was wearing!"
				label.visible_ratio = 0.0
			if dishes.button_pressed:
				winpercentage -= 10.0
				dishes.disabled = true
				talking = true
				label.text = "What does this have to do with the case?!"
				label.visible_ratio = 0.0
			if alibi.button_pressed:
				winpercentage += 20.0
				alibi.disabled = true
				talking = true
				label.text = "There is no way to confirm or deny the alibi!"
				label.visible_ratio = 0.0
			if blood.button_pressed:
				winpercentage += -10.0
				blood.disabled = true
				talking = true
				label.text = "the blood type doesn't match!"
				label.visible_ratio = 0.0
			
		
	
		
