extends Area2D

@export var serum_id := ""   # "A", "B", or "Rh" Change in inspector tab of serum nodes
var activated := false
signal registered

func _ready():
	print("Serum", serum_id, "ready.")

func activate():
	if serum_id == "A":
		Color(1.0, 0.0, 0.224, 1.0)  # blue = no reaction
	if activated:
		print("Serum", serum_id, "already activated")
		return

	activated = true

												#Add this if we want color again
	print("Serum", serum_id, "tested. No reaction (negative).")
	emit_signal("registered")
