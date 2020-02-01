extends Node2D

var i=0
export(PackedScene) var scene
onready var sprite = get_node("Sprite")

func _ready():
	spawnUnit()
	

func spawnUnit():
	var instance = scene.instance()
	add_child(instance)
	instance.name = "Enemy" + str(i)
	randomizeUnitItem()
	i+=1

func randomizeUnitItem():
	var enemy = get_node("Enemy"+str(i))
	var array = []
	for key in enemy.EQUIPMENT:
		array.push_back(key)
	randomize()
	var rand = randi()%6+1
	#print(rand)
	var itemName = array[rand]
	#print(itemName)
	enemy.equipItem(itemName)
	if itemName == "none":
		return
	changeSprite(itemName)
	

func changeSprite(itemName):
	if itemName.find("sword") != -1:
		sprite.modulate = Color(1,0,0)
	elif itemName.find("shield") != -1:
		sprite.modulate = Color(0,0,1)
	elif itemName.find("bow") != -1:
		sprite.modulate = Color(0,1,0)
			
