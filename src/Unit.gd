extends Node2D
class_name Unit

export var velocity = 1.0
export var itemEquipped = "none"
var noCollision = true

const EQUIPMENT = {
	"sword_1": ["shield_1"],
	"sword_2": ["shield_1", "shield_2"],
	"shield_1": ["bow_1"],
	"shield_2": ["bow_1", "bow_2"],
	"bow_1": ["sword_1"],
	"bow_2": ["sword_1", "sword_2"]
}

func _process(delta):
	if noCollision:
		self.set_position(Vector2(self.get_position().x + velocity,self.get_position().y ))

func _on_Area2D_area_entered(area):
	if area.get_name() == "Detector":
		noCollision = false
	resolveCombat(area.get_parent().itemEquipped)
	
	
func resolveCombat(rivalItem):
	for value in EQUIPMENT[itemEquipped]:
		if value == rivalItem:
			print(itemEquipped + " wons vs " + rivalItem)
			#run win animation, increase win bar
			
			return
	print(itemEquipped + " loses to " + rivalItem)
	#run death animation, diminish win bar
	queue_free()

func equipItem(item):
	itemEquipped = item
	#change sprite
