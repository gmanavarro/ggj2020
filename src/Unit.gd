extends Node2D
class_name Unit

export var itemEquipped = "none"
const EQUIPMENT = {
	"sword_1": ["shield_1"],
	"sword_2": ["shield_1", "shield_2"],
	"shield_1": ["bow_1"],
	"shield_2": ["bow_1", "bow_2"],
	"bow_1": ["sword_1"],
	"bow_2": ["sword_1", "sword_2"]
}

func resolveCombat(rivalItem):
	for value in EQUIPMENT[itemEquipped]:
		if value == rivalItem:
			print(itemEquipped + " wons vs " + rivalItem)
			#run win animation, increase win bar
			
			return
	print(itemEquipped + " loses to " + rivalItem)
	#run death animation, diminish win bar
	queue_free()
