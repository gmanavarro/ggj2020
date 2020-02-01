extends GridContainer

var resources_names = [ "wood", "leather", "steel" ]


func _ready():
	
	print("Att: %s\nDef: %s" % [69,96])

func RepairButton_pressed():
	if Hand.holded_card != null:
		for i in range(Hand.holded_card.data.repair_resources.size()):
			GameManager.RESOURCES_MANAGER.remove_resource(resources_names[i],Hand.holded_card.data.repair_resources[i])


func _DismantleButton_pressed():
	if Hand.holded_card != null:
		for i in range(Hand.holded_card.data.dismantle_resources.size()):
			GameManager.RESOURCES_MANAGER.add_resource(resources_names[i],Hand.holded_card.data.dismantle_resources[i])
			
		Hand.holded_card.destroy()
