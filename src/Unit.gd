extends Node2D
class_name Unit

export var velocity = 1.0
export var itemEquipped = "none"
var noCollision = true

const EQUIPMENT = {
	"none": [],
	"sword_1": ["shield_1", "none"],
	"sword_2": ["shield_1", "shield_2", "none"],
	"shield_1": ["bow_1", "none"],
	"shield_2": ["bow_1", "bow_2", "none"],
	"bow_1": ["sword_1", "none"],
	"bow_2": ["sword_1", "sword_2", "none"]
}

# warning-ignore:unused_argument
func _process(delta):
	if noCollision:
		self.set_position(Vector2(self.get_position().x + velocity, self.get_position().y ))

func _on_Area2D_area_entered(area):
	if area.get_name() == "Detector":
		noCollision = false
	resolveCombat(area.get_parent().itemEquipped)
	get_parent().spawnUnit()
	area.get_parent().get_parent().spawnUnit()
	queue_free()
	area.get_parent().queue_free()
	
func resolveCombat(rivalItem):
	for value in EQUIPMENT[itemEquipped]:
		
		if value == rivalItem:
			print(get_parent().name + ": " + itemEquipped + " wons vs " + rivalItem)
			#run win animation, increase win bar
			get_parent().combatWon()
			
			return
	#print(itemEquipped + " loses to " + rivalItem)
	#run death animation, diminish win bar
	#print(rivalItem + " " + itemEquipped)
	if rivalItem == itemEquipped:
		pass
	else:
		get_parent().combatLost()
	


func equipItem(item):
	
	itemEquipped = item
	print(self.name + ": " + itemEquipped + " equipped")
	#change sprite



