extends Node2D

var i = 0
export(PackedScene) var scene
onready var sprite = get_node("Sprite")
signal combat_won
signal combat_lost

func _ready():
	#spawnUnit()
	pass
func spawnUnit():
	var instance = scene.instance()
	call_deferred("add_child",instance)
#	add_child(instance)
	sprite.modulate = Color(1,1,1)

# warning-ignore:unused_argument
func applyCard(item):
	var soldier = get_child(1)
	var array = []
	for key in soldier.EQUIPMENT:
		array.push_back(key)
	randomize()
	var rand = (randi()%6)+1
	#print(rand)
	var itemName = array[rand]
	soldier.equipItem(itemName)
	changeSprite(itemName)
	

func changeSprite(itemName):
	if itemName.find("sword") != -1:
		sprite.modulate = Color(1,0,0)
	elif itemName.find("shield") != -1:
		sprite.modulate = Color(0,0,1)
	elif itemName.find("bow") != -1:
		sprite.modulate = Color(0,1,0)
			
	
func combatWon():
	emit_signal("combat_won")

func combatLost():
	emit_signal("combat_lost")

func _on_Button_button_down():
	applyCard("asd")



func _on_Button3_button_down():
	applyCard("asd")


func _on_Button2_button_down():
	applyCard("asd")
