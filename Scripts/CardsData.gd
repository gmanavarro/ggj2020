extends Node

onready var CARDS = {
	"sword_1":
		Card.new("Espada esclava",preload("res://Assets/Img/espadas2.png") as Texture,"Espada oxidada de baja calidad",5,1),
	"sword_2":
		Card.new("Espada de vikingo",preload("res://Assets/Img/espadas2.png") as Texture,"Espada forjada por Odín",10,2),
	"shield_1":
		Card.new("Escudo de madera",preload("res://Assets/Img/escudos2.png") as Texture,"Escudo maltrecho de madera mohosa",2,4),
	"shield_2":
		Card.new("Escudo de metal",preload("res://Assets/Img/espadas2.png") as Texture,"Escudo pesado de gran calidad",3,10),
	"bow_1":
		Card.new("Arco de caza",preload("res://Assets/Img/arcos.png") as Texture,"Arco de uso básico",5,0),
	"bow_2":
		Card.new("Arco de combate",preload("res://Assets/Img/arcos.png") as Texture,"Arco utilizado en la guerra de Vietnam",10,0)
}

func get_random_card_data():
	randomize()
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
