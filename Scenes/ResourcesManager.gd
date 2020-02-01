extends GridContainer

onready var wood_label = $WoodAmount
onready var leather_label = $LeatherAmount
onready var steel_label = $SteelAmount

var resources = {
	"wood": 0,
	"leather": 0,
	"steel": 0
}

func _ready():
	GameManager.RESOURCES_MANAGER = self

func add_resource(key : String, amount: int):
	resources[key] += amount
	update_labels()
func remove_resource(key : String, amount: int):
	resources[key] -= amount
	update_labels()

func update_labels():
	wood_label.text = str(resources["wood"])
	leather_label.text = str(resources["leather"])
	steel_label.text = str(resources["steel"])
