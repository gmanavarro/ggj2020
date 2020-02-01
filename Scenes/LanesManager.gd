extends GridContainer

func _ready():
	GameManager.LANES_MANAGER = self



func _on_Lane_pressed(id):
	if Hand.holded_card != null:
		print("pressed Lane : " + str(id))
	pass # Replace with function body.
