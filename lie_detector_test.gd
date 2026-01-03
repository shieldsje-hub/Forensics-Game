extends Node2D
@onready var followpoint: Node2D = $followpoint
@onready var suspect_1b: Button = $"suspectselection/suspect1 (chef1)"
@onready var suspect_2b: Button = $"suspectselection/suspect2 (chef2)"
@onready var suspect_3b: Button = $"suspectselection/suspect3 (chef3)"
@onready var suspect_4b: Button = $"suspectselection/suspect4 (the kid)"
@onready var suspect_5b: Button = $"suspectselection/suspect5 (the waitress)"
@onready var suspect_6b: Button = $"suspectselection/suspect6 (the clerk)"



@onready var question_1: Button = $Node2D/question1
@onready var question_2: Button = $Node2D/question2
@onready var question_3: Button = $Node2D/question3

@onready var speechbubble: Sprite2D = $Speechbubble
@onready var label: Label = $Label
@onready var followpoint_sprite2d: Sprite2D = $followpoint/Sprite2D


@onready var chef_1: Sprite2D = $Chef1
@onready var chef_2: Sprite2D = $Chef2
@onready var chef_3: Sprite2D = $Chef3
@onready var thekid: Sprite2D = $Thekid
@onready var waitress: Sprite2D = null   #change these to the new stuff
@onready var clerk: Sprite2D = null 

const polyline = preload("res://polygraphlines.tscn")
var polylineline = polyline.instantiate()


var suspect1 = bool(false)
var suspect2 = bool(false)
var suspect3 = bool(false)
var suspect4 = bool(false)
var suspect5 = bool(false)
var suspect6 = bool(false)

var done1 = bool(false)
var done11 = bool(false)
var done2 = bool(false)
var done22 = bool(false)
var done3 = bool(false)
var done33 = bool(false)
var done4 = bool(false)
var done44 = bool(false)
var done5 = bool(false)
var done55 = bool(false)
var done6 = bool(false)
var done66 = bool(false)
var has_knife = int()
var talking = bool(false)
var questioning = bool(false)
var questionstage = int(0)
var lyingfactor = float(-3.0)
var timer = float(0.0)
var general = bool(false)
var spawncount = int(0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	talking = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if inventory.has_item("knife_tampered"):
		has_knife = 1
	if inventory.has_item("knife_bloody"):
		has_knife = 2
	if inventory.has_item("knife_clean"):
		has_knife = 3
	
		
	buttonstuff()
	miscstuff(delta)
	questionstuff()
	theanswers()
	polygraph(delta)
func buttonstuff() -> void:
	if done1: 
		suspect_1b.disabled = true
	if done2:
		suspect_2b.disabled = true
	if done3:
		suspect_3b.disabled = true
	if done4:
		suspect_4b.disabled = true
	if done5:
		suspect_5b.disabled = true
	if done6:
		suspect_6b.disabled = true
	
	
	if suspect_1b.button_pressed == true:
		chef_1.visible = true
		chef_2.visible = false
		chef_3.visible = false
		thekid.visible = false
		#waitress.visible = false
		#clerk.visible = false
		suspect1 = true
		suspect2 = false
		suspect3 = false
		suspect4 = false
		suspect5 = false
		suspect6 = false
		questionstage = 1
		lyingfactor = -4.0
	if suspect_2b.button_pressed == true:
		chef_1.visible = false
		chef_2.visible = true
		chef_3.visible = false
		thekid.visible = false
		#waitress.visible = false
		#clerk.visible = false
		suspect1 = false
		suspect2 = true
		suspect3 = false
		suspect4 = false
		suspect5 = false
		suspect6 = false
		questionstage = 1
		lyingfactor = -6.0
	if suspect_3b.button_pressed == true:
		chef_1.visible = false
		chef_2.visible = false
		chef_3.visible = true
		thekid.visible = false
		#waitress.visible = false
		#clerk.visible = false
		suspect1 = false
		suspect2 = false
		suspect3 = true
		suspect4 = false
		suspect5 = false
		suspect6 = false
		questionstage = 1
		lyingfactor = -7.0
	if suspect_4b.button_pressed == true:
		chef_1.visible = false
		chef_2.visible = false
		chef_3.visible = false
		thekid.visible = true
		#waitress.visible = false
		#clerk.visible = false
		suspect1 = false
		suspect2 = false
		suspect3 = false
		suspect4 = true
		suspect5 = false
		suspect6 = false
		questionstage = 1
		lyingfactor = -6.0
	if suspect_5b.button_pressed == true:
		chef_1.visible = false
		chef_2.visible = false
		chef_3.visible = false
		thekid.visible = false
		#waitress.visible = true
		#clerk.visible = false
		suspect1 = true
		suspect2 = false
		suspect3 = false
		suspect4 = false
		suspect5 = false
		suspect6 = false
		questionstage = 1
func questionstuff() -> void:
	if (suspect1 == true or suspect2 == true or suspect3 == true or suspect4 == true or suspect5 == true or suspect6 == true) and not talking:
		questioning = true
	else:
		questioning = false
		
	if questioning:
		question_1.visible = true
		question_2.visible = true
		question_3.visible = true
	else:
		question_1.visible = false
		question_2.visible = false
		question_3.visible = false
	
	if questioning and suspect1:
		if questionstage == 1:
			if not has_knife:
				question_1.text = "where were you at the time of the murder?"
				question_2.text = "do you have an alibi?"
				question_3.text = "what colour are apples."
			else:
				question_1.text = "where were you at the time of the murder?"
				question_2.text = "do you have an alibi?"
				question_3.text = "what colour are apples."
		if questionstage == 2:
			question_1.text = "how do you know the owner?"
			question_2.text = "have you had any arguments at the workplace lately?"
			question_3.text = "how many parents do you have?"
		if questionstage == 3:
			question_1.text = "what's 9 + 10?"
			question_2.text = "do you have any idea who the murderer could be?"
			question_3.text = "we know it's you, just confess."
	elif questioning and suspect2:
		if questionstage == 1:
			question_1.text = "where were you at the time of the murder?"
			question_2.text = "do you have an alibi?"
			question_3.text = "when did the man go to the doctor?"
		if questionstage == 2:
			question_1.text = "how do you know the owner?"
			question_2.text = "have you had any arguments at the workplace lately?"
			question_3.text = "have you ever hurt someone you know?"
		if questionstage == 3:
			question_1.text = "where did you get that cut?"
			question_2.text = "do you have any idea who the murderer could be?"
			question_3.text = "we know it's you, just confess."
	elif questioning and suspect3:
		if questionstage == 1:
			question_1.text = "where were you at the time of the murder?"
			question_2.text = "do you have an alibi?"
			question_3.text = "are you innocent?"
		if questionstage == 2:
			question_1.text = "how do you know the owner"
			question_2.text = "have you had any arguments at the workplace lately?"
			question_3.text = "how many fingers am I holding up?"
		if questionstage == 3:
			question_1.text = "how did you injure your palm?"
			question_2.text = "do you have any idea who the murderer could be?"
			question_3.text = "we know it's you, just confess."
	elif questioning and suspect4:
		if questionstage == 1:
			question_1.text = "where were you at the time of the murder?"
			question_2.text = "do you have an alibi?"
			question_3.text = "what colour are apples."
		if questionstage == 2:
			question_1.text = "how close were you with your dad?"
			question_2.text = "have you had any arguments at the workplace lately?"
			question_3.text = "do you have any pets?"
		if questionstage == 3:
			question_1.text = "we can help bring your fathers murderer to justice, you just need to tell us everything you know."
			question_2.text = "do you have any idea who the murderer could be?"
			question_3.text = "we know it's you, just confess."
	elif questioning and suspect5:
		if questionstage == 1:
			question_1.text = "where were you at the time of the murder?"
			question_2.text = "do you have an alibi?"
			question_3.text = "you live with your family?"
		if questionstage == 2:
			question_1.text = "how do you know the owner?"
			question_2.text = "have you had any arguments at the workplace lately?"
			question_3.text = "any pets?"
		if questionstage == 3:
			question_1.text = "do you know who was still working in the restaurant when you left?"
			question_2.text = "do you have any idea who the murderer could be?"
			question_3.text = "we know it's you, just confess."
	elif questioning and suspect6:
		if questionstage == 1:
			question_1.text = "where were you at the time of the murder?"
			question_2.text = "do you have an alibi?"
			question_3.text = "what colour are oranges?"
		if questionstage == 2:
			question_1.text = "how do you know the owner?"
			question_2.text = "have you had any arguments at the workplace lately?"
			question_3.text = "do you have any pets?"
		if questionstage == 3:
			question_1.text = "how long have you worked here?"
			question_2.text = "do you have any idea who the murderer could be?"
			question_3.text = "we know it's you, just confess."
func miscstuff(delta) -> void:
	if talking and Input.is_action_just_pressed("next"):
		if label.visible_ratio == 1.0:
			talking = false
			questionstage += 1
		else:
			label.visible_ratio = 1.0
		if done1 and not done11:
			suspect1 = false
			suspect2 = true
			chef_1.visible = false
			chef_2.visible = true
			done11 = true
			lyingfactor = -6.0
		elif done2 and not done22:
			suspect2 = false
			suspect3 = true
			chef_2.visible = false
			chef_3.visible = true
			done22 = true
			lyingfactor = -7.0
		elif done3 and not done33:
			suspect3 = false
			suspect4 = true
			chef_3.visible = false
			thekid.visible = true
			done33 = true
			lyingfactor = -6.0
		elif done4 and not done44:
			suspect4 = false
			suspect5 = true
			thekid.visible = false
			#waitress.visible = true
			done44 = true
		elif done5 and not done55:
			suspect5 = false
			suspect6 = true
			#waitress.visible = false
			#clerk.visible = true
			done55 = true
		elif done6 and not done66:
			suspect3 = false
			suspect4 = true
			#clerk.visible = false
			#get_tree().scene_changed #idk change tree cause you're done
			done55 = true
	if questionstage == 4 and talking == false:
		talking = true
		label.text = "If that's all I'll be seeing myself out."
		questionstage = 0
		if suspect1:
			done1 = true
		elif suspect2:
			done2 = true
		elif suspect3:
			done3 = true
		elif suspect4:
			done4 = true
		elif suspect5:
			done5 = true
		elif suspect6:
			done6 = true
	if talking:
		speechbubble.visible = true
		label.visible_ratio += (delta/label.get_total_character_count()) * 16
	else:
		speechbubble.visible = false
		label.visible_ratio = 0.0
func theanswers() -> void:
	if questioning:
		if questionstage == 1:
##############################suspect 1 stage 1 questions#########################################################################################################
			if suspect1:
				if question_1.button_pressed == true:
					talking = true #where were you
					label.text = "I Didn't go to work that day. I took a sick day and spent it at my grandmas, you can ask her yourself."
					lyingfactor = -5.0
				elif question_2.button_pressed == true:
					talking = true #alibi?
					label.text = "yes, I was at my grandmothers house, I was home sick, you can ask her if you let me contact her."
					lyingfactor = -4.0
				elif question_3.button_pressed == true:
					talking = true #what where you doing
					label.text = "uh... red."
					lyingfactor = -5.0
					
					#baseline: 4.0
#############################suspect 2 stage 1 questions############################################################################################################
			elif suspect2:
				if question_1.button_pressed == true:
					talking = true
					label.text = "oh I was at the movies, left right after work to catch up with some old friends."
					lyingfactor = -7.0
				elif question_2.button_pressed == true:
					talking = true
					label.text = "yeah, I went to the movies after work, left (the clerk) and (owner) to lock up."
					lyingfactor = -8.0
				elif question_3.button_pressed == true:
					talking = true
					label.text = "at toothirty..."
					lyingfactor = -6.0
					
				#baseline : 6.0
###############################suspect 3 stage 1 questions##########################################################################################################
			elif suspect3:
				if question_1.button_pressed == true:
					talking = true
					label.text = "I went home early that day, (owner) said I was just in the way"
					lyingfactor = -11.0
				elif question_2.button_pressed == true:
					talking = true
					label.text = "I was sent home early by (owner). my sister was home at the time, you can ask her."
					lyingfactor = -7.0
				elif question_3.button_pressed == true:
					talking = true
					label.text = "I swear I didn't do anything illegal, I'm a law abiding citizen!"
					lyingfactor = -13.0
				#baseline 7.0
#################################suspect 4 stage 1 questions########################################################################################################
			elif suspect4:
				if question_1.button_pressed == true:
					talking = true
					label.text = "I was at chef school, my... my Father always wanted me to take over. not like this though... not like this."
					lyingfactor = -9.0
				elif question_2.button_pressed == true:
					talking = true
					label.text = "yeah, I was at chef school learning to cook, you can ask my teacher."
					lyingfactor = -6.0
				elif question_3.button_pressed == true:
					talking = true
					label.text = "are you kidding me? you brought me here after my father died just to question me about apples?"
					lyingfactor = -10.0
					
				#baseline: 6.0
##################################suspect 5 stage 1 questions#######################################################################################################
			elif suspect5:
				if question_1.button_pressed == true:
					talking = true
					label.text = "after I left work I head straight home, I live with my dad so he can vouch for me."
					lyingfactor = -4.0
				elif question_2.button_pressed == true:
					talking = true
					label.text = "I was home with my dad after work, you can ask him yourself"
					lyingfactor = -4.5
				elif question_3.button_pressed == true:
					talking = true
					label.text = "just my dad, my mother died in a car crash a couple years ago."
					lyingfactor = -7.0
				#baseline: 3.0
####################################suspect 6 stage 1 questions#####################################################################################################
			elif suspect6:
				if question_1.button_pressed == true:
					talking = true
					label.text = "at home"
				elif question_2.button_pressed == true:
					talking = true
					label.text = "I left (owner) and (chef 2) to lockup after my shift was over, went home after that but I live alone, so no."
				elif question_3.button_pressed == true:
					talking = true
					label.text = "they're orange, like their name."
###########################stage######################################################################################
#############################2############################################################################################################
		elif questionstage == 2:
###################################suspect 1 stage 2 questions######################################################################################################
			if suspect1:
				if question_1.button_pressed == true:
					talking = true #how do you know the owner
					label.text = "I've worked at this restaurant for many years, was one of (owner's name)'s first cooks, he was a good man but I didn't see him much outside of work."
					lyingfactor = -3.0
				elif question_2.button_pressed == true:
					talking = true #have you had any arguments at the workplace lately
					label.text = "Not any major ones, but there is occasional bickering from the new recruits."
					lyingfactor = -5.0
				elif question_3.button_pressed == true:
					talking = true # have you hever hurt someone
					label.text = "well I'm pretty sure the answers 2, but I haven't checked recently."
					lyingfactor = -6.0
###################################suspect 2 stage 2 questions######################################################################################################
			elif suspect2:
				if question_1.button_pressed == true:
					talking = true # how do you know the owner
					label.text = "I met him when I applied for this job outta highschool, he's nice I guess but I think he pushes us too hard."
					lyingfactor = -7.0
				elif question_2.button_pressed == true:
					talking = true
					label.text = "no."
					lyingfactor = -11.0
				elif question_3.button_pressed == true:
					talking = true
					label.text = "I think everybody hurts someone from time to time."
					lyingfactor = -7.0
###################################suspect 3 stage 2 questions######################################################################################################
			elif suspect3:
				if question_1.button_pressed == true:
					talking = true
					label.text = "________________________________"
				elif question_2.button_pressed == true:
					talking = true
					label.text = "________________________________"
				elif question_3.button_pressed == true:
					talking = true
					label.text = "________________________________"
###################################suspect 4 stage 2 questions######################################################################################################
			elif suspect4:
				if question_1.button_pressed == true:
					talking = true
					label.text = "________________________________"
				elif question_2.button_pressed == true:
					talking = true
					label.text = "________________________________"
				elif question_3.button_pressed == true:
					talking = true
					label.text = "________________________________"
###################################suspect 5 stage 2 questions######################################################################################################
			elif suspect5:
				if question_1.button_pressed == true:
					talking = true
					label.text = "________________________________"
				elif question_2.button_pressed == true:
					talking = true
					label.text = "________________________________"
				elif question_3.button_pressed == true:
					talking = true
					label.text = "________________________________"
###################################suspect 6 stage 2 questions######################################################################################################
			elif suspect6:
				if question_1.button_pressed == true:
					talking = true
					label.text = "________________________________"
				elif question_2.button_pressed == true:
					talking = true
					label.text = "________________________________"
				elif question_3.button_pressed == true:
					talking = true
					label.text = "________________________________"
###################################stage######################################################################################################
#####################################3######################################################################################################
		elif questionstage == 3:
###################################suspect 1 stage 2 questions######################################################################################################
			if suspect1:
				if question_1.button_pressed == true:
					talking = true #contact with workers on murder day
					label.text = "21, obviously"
					lyingfactor = -3.0
				elif question_2.button_pressed == true:
					talking = true #who do you think it is
					label.text = "nobody in particular, but (ownername) has had a history of encouraging his workers to work harder."
					lyingfactor = -6.5
				elif question_3.button_pressed == true:
					talking = true #we know it's you
					label.text = "I doubt that, I think I would have remembered something as serious as murder."
					lyingfactor = -9.0
###################################suspect 2 stage 3 questions######################################################################################################
			elif suspect2:
				if question_1.button_pressed == true:
					talking = true # where cut
					label.text = "I guess I sliced so many vegtables it was hard to tell finger from food."
					lyingfactor = -5.0
				elif question_2.button_pressed == true:
					talking = true # who do you think it was
					label.text = "I don't mean to point fingers but It was kinda suspicious how (clerk) was last at the restaurant alone with (owner)."
					lyingfactor = -7.0
				elif question_3.button_pressed == true:
					talking = true # we know it's you
					label.text = "yeah right, I'm not falling for that."
					lyingfactor = -11.0
###################################suspect 3 stage 3 questions######################################################################################################
			elif suspect3:
				if question_1.button_pressed == true:
					talking = true
					label.text = "________________________________"
				elif question_2.button_pressed == true:
					talking = true
					label.text = "________________________________"
				elif question_3.button_pressed == true:
					talking = true
					label.text = "________________________________"
###################################suspect 4 stage 3 questions######################################################################################################
			elif suspect4:
				if question_1.button_pressed == true:
					talking = true
					label.text = "________________________________"
				elif question_2.button_pressed == true:
					talking = true
					label.text = "________________________________"
				elif question_3.button_pressed == true:
					talking = true
					label.text = "________________________________"
###################################suspect 5 stage 3 questions######################################################################################################
			elif suspect5:
				if question_1.button_pressed == true:
					talking = true
					label.text = "________________________________"
				elif question_2.button_pressed == true:
					talking = true
					label.text = "________________________________"
				elif question_3.button_pressed == true:
					talking = true
					label.text = "________________________________"
###################################suspect 6 stage 3 questions######################################################################################################
			elif suspect6:
				if question_1.button_pressed == true:
					talking = true
					label.text = "________________________________"
				elif question_2.button_pressed == true:
					talking = true
					label.text = "________________________________"
				elif question_3.button_pressed == true:
					talking = true
					label.text = "________________________________"
func polygraph(delta) -> void:
	
	followpoint.global_position.y =  move_toward(followpoint.global_position.y, lyingfactor * 10, delta * 16)
	lyingfactor += randf_range(-1.0, 1.0) * delta
	lyingfactor = clampf(lyingfactor, -13.0, 0.0)
	
		
	#spawnline(delta)
		
	
func spawnline(delta) -> void:
	
	spawncount += 1
	
	polylineline.name = "polylineline" + str(spawncount)
	polylineline.global_position = followpoint_sprite2d.global_position
	add_child(polylineline)
	
		
		
		
