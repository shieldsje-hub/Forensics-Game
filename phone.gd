extends Node2D
@onready var button_1: Button = $"calloptions/button 1"
@onready var button_2: Button = $"calloptions/button 2"
@onready var button_3: Button = $"calloptions/button 3"
@onready var button_4: Button = $"calloptions/button 4"
@onready var button_5: Button = $"calloptions/button 5"
@onready var label: Label = $Label
var calling = bool(false)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if calling:
		button_1.visible = false
		button_2.visible = false
		button_3.visible = false
		button_4.visible = false
		button_5.visible = false
		label.visible_ratio += (delta/label.get_total_character_count()) * 16
		label.visible = true
	else:
		button_1.visible = true
		button_2.visible = true
		button_3.visible = true
		button_4.visible = true
		button_5.visible = true
		label.visible = false
	
	if Input.is_action_just_pressed("next"):
		if label.visible_ratio == 1.0:
			calling = false
		else:
			label.visible_ratio = 1.0
	
	
	
	
	
	if inventory.has_item("Suspect 1 alibi"):
		button_1.text = "Call (Chef 1)'s Grandma"
	elif inventory.has_item("Suspect 2 alibi"):
		button_1.text = "Call (Chef 2)'s Friends"
	elif inventory.has_item("Suspect 3 alibi"):
		button_1.text = "Call (Chef 3)'s Sister"
	elif inventory.has_item("Suspect 4 alibi"):
		button_1.text = "Call (kid)'s Teacher"
	elif inventory.has_item("Suspect 5 alibi"):
		button_1.text = "Call (waitress)'s Dad"
	else:
		button_1.text = ""
	
	if inventory.has_item("Suspect 1 alibi"):
		if inventory.has_item("Suspect 2 alibi"):
			button_2.text = "Call (Chef 2)'s Friends"
		elif inventory.has_item("Suspect 3 alibi"):
			button_2.text = "Call (Chef 3)'s Sister"
		elif inventory.has_item("Suspect 4 alibi"):
			button_2.text = "Call (kid)'s Teacher"
		elif inventory.has_item("Suspect 5 alibi"):
			button_2.text = "Call (waitress)'s Dad"
		else:
			button_2.text = ""
	elif inventory.has_item("Suspect 2 alibi"):
		if inventory.has_item("Suspect 3 alibi"):
			button_2.text = "Call (Chef 3)'s Sister"
		elif inventory.has_item("Suspect 4 alibi"):
			button_2.text = "Call (kid)'s Teacher"
		elif inventory.has_item("Suspect 5 alibi"):
			button_2.text = "Call (waitress)'s Dad"
		else:
			button_2.text = ""
	elif inventory.has_item("Suspect 3 alibi"):
		if inventory.has_item("Suspect 4 alibi"):
			button_2.text = "Call (kid)'s Teacher"
		elif inventory.has_item("Suspect 5 alibi"):
			button_2.text = "Call (waitress)'s Dad"
		else:
			button_2.text = ""
	elif inventory.has_item("Suspect 4 alibi"):
		if inventory.has_item("Suspect 5 alibi"):
			button_2.text = "Call (waitress)'s Dad"
		else:
			button_2.text = ""
	else:
		button_2.text = ""
	
	if inventory.has_item("Suspect 1 alibi"):
		if inventory.has_item("Suspect 3 alibi"):
			button_3.text = "Call (Chef 3)'s Sister"
		elif inventory.has_item("Suspect 4 alibi"):
			button_3.text = "Call (kid)'s Teacher"
		elif inventory.has_item("Suspect 5 alibi"):
			button_3.text = "Call (waitress)'s Dad"
		else:
			button_3.text = ""
	elif inventory.has_item("Suspect 2 alibi"):
		if inventory.has_item("Suspect 4 alibi"):
			button_3.text = "Call (kid)'s Teacher"
		elif inventory.has_item("Suspect 5 alibi"):
			button_3.text = "Call (waitress)'s Dad"
		else:
			button_3.text = ""
	elif inventory.has_item("Suspect 3 alibi"):
		if inventory.has_item("Suspect 5 alibi"):
			button_3.text = "Call (waitress)'s Dad"
		else:
			button_3.text = ""
	else:
		button_3.text = ""
	
	if inventory.has_item("Suspect 1 alibi"):
		if inventory.has_item("Suspect 4 alibi"):
			button_4.text = "Call (kid)'s Teacher"
		elif inventory.has_item("Suspect 5 alibi"):
			button_4.text = "Call (waitress)'s Dad"
		else:
			button_4.text = ""
	elif inventory.has_item("Suspect 2 alibi"):
		if inventory.has_item("Suspect 5 alibi"):
			button_4.text = "Call (waitress)'s Dad"
		else:
			button_4.text = ""
	else:
		button_4.text = ""
	
	if inventory.has_item("Suspect 1 alibi"):
		if inventory.has_item("Suspect 5 alibi"):
			button_5.text = "Call (waitress)'s Dad"
		else:
			button_5.text = ""
	else:
		button_5.text = ""
	
	
		
	if button_1.button_pressed:
		if button_1.text == "Call (Chef 1)'s Grandma":
			calling = true
			label.text = "yes he was at home that day."
			label.visible_ratio = 0.0
			inventory.remove_item("Suspect 1 alibi")
			inventory.add_item("Suspect 1 alibi (confirmed)")
		elif button_1.text == "Call (Chef 2)'s Friends":
			calling = true
			label.text = "no, we went without him, he said he was cought up in work"
			label.visible_ratio = 0.0
			inventory.remove_item("Suspect 2 alibi")
			inventory.add_item("Suspect 2 alibi (false)")
		elif button_1.text == "Call (Chef 3)'s Sister":
			calling = true
			label.text = "yeah he came home early that day."
			label.visible_ratio = 0.0
			inventory.remove_item("Suspect 3 alibi")
			inventory.add_item("Suspect 3 alibi (confirmed)")
		elif button_1.text == "Call (kid)'s Teacher":
			calling = true
			label.text = "(kid) was hard at work learning to cook that day."
			label.visible_ratio = 0.0
			inventory.remove_item("Suspect 4 alibi")
			inventory.add_item("Suspect 4 alibi (confirmed)")
		elif button_1.text == "Call (waitress)'s Dad":
			calling = true
			label.text = "yeah she was home around that time."
			label.visible_ratio = 0.0
			inventory.remove_item("Suspect 5 alibi")
			inventory.add_item("Suspect 5 alibi (confirmed)")
	if button_2.button_pressed:
		if button_2.text == "Call (Chef 2)'s Friends":
			calling = true
			label.text = "no, we went without him, he said he was cought up in work"
			label.visible_ratio = 0.0
			inventory.remove_item("Suspect 2 alibi")
			inventory.add_item("Suspect 2 alibi (confirmed)")
		elif button_2.text == "Call (Chef 3)'s Sister":
			calling = true
			label.text = "yeah he came home early that day."
			label.visible_ratio = 0.0
			inventory.remove_item("Suspect 3 alibi")
			inventory.add_item("Suspect 3 alibi (confirmed)")
		elif button_2.text == "Call (kid)'s Teacher":
			calling = true
			label.text = "(kid) was hard at work learning to cook that day."
			label.visible_ratio = 0.0
			inventory.remove_item("Suspect 4 alibi")
			inventory.add_item("Suspect 4 alibi (confirmed)")
		elif button_2.text == "Call (waitress)'s Dad":
			calling = true
			label.text = "yeah she was home around that time."
			label.visible_ratio = 0.0
			inventory.remove_item("Suspect 5 alibi")
			inventory.add_item("Suspect 5 alibi (confirmed)")
	if button_3.button_pressed:
		if button_3.text == "Call (Chef 3)'s Sister":
			calling = true
			label.text = "yeah he came home early that day."
			label.visible_ratio = 0.0
			inventory.remove_item("Suspect 3 alibi")
			inventory.add_item("Suspect 3 alibi (confirmed)")
		elif button_3.text == "Call (kid)'s Teacher":
			calling = true
			label.text = "(kid) was hard at work learning to cook that day."
			label.visible_ratio = 0.0
			inventory.remove_item("Suspect 4 alibi")
			inventory.add_item("Suspect 4 alibi (confirmed)")
		elif button_3.text == "Call (waitress)'s Dad":
			calling = true
			label.text = "yeah she was home around that time."
			label.visible_ratio = 0.0
			inventory.remove_item("Suspect 5 alibi")
			inventory.add_item("Suspect 5 alibi (confirmed)")
	if button_4.button_pressed:
		if button_4.text == "Call (kid)'s Teacher":
			calling = true
			label.text = "(kid) was hard at work learning to cook that day."
			label.visible_ratio = 0.0
			inventory.remove_item("Suspect 4 alibi")
			inventory.add_item("Suspect 4 alibi (confirmed)")
		elif button_4.text == "Call (waitress)'s Dad":
			calling = true
			label.text = "yeah she was home around that time."
			label.visible_ratio = 0.0
			inventory.remove_item("Suspect 5 alibi")
			inventory.add_item("Suspect 5 alibi (confirmed)")
	if button_5.button_pressed:
		if button_5.text == "Call (waitress)'s Dad":
			calling = true
			label.text = "yeah she was home around that time."
			label.visible_ratio = 0.0
			inventory.remove_item("Suspect 5 alibi")
			inventory.add_item("Suspect 5 alibi (confirmed)")
#if inventory.has_item("Suspect 1 alibi") and inventory.has_item("Suspect 2 alibi") and inventory.has_item("Suspect 3 alibi") and inventory.has_item("Suspect 4 alibi") and inventory.has_item("Suspect 5 alibi"):
		#calloptions = 5
	#elif inventory.has_item("Suspect 1 alibi") and inventory.has_item("Suspect 2 alibi") and inventory.has_item("Suspect 3 alibi") and inventory.has_item("Suspect 4 alibi"):
		#calloptions = 4
	#elif inventory.has_item("Suspect 1 alibi") and inventory.has_item("Suspect 2 alibi") and inventory.has_item("Suspect 3 alibi"):
		#calloptions = 3
	#elif inventory.has_item("Suspect 1 alibi") and inventory.has_item("Suspect 2 alibi"):
		#calloptions = 2
	#elif inventory.has_item("Suspect 1 alibi"):
		#calloptions = 1
	#else:
		#calloptions = 0
		
	#if calloptions == 5:
