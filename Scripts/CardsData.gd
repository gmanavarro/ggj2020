extends Node

onready var CARDS = {
	"sword":
		Card.new("Sword",preload("res://WhiteTexture.png") as Texture,"Increases attack damage",2,0)
}

func get_random_card_data():
	var random_index = int(rand_range(0,CARDS.size()))
	var key = CARDS.keys()[random_index]
	return CARDS[key]

class Card:
	var title
	var image
	var description
	var attack
	var defense
	
	func _init(_title, _image, _description, _attack, _defense):
		self.title = _title
		self.image = _image
		self.description = _description
		self.attack = _attack
		self.defense = _defense
