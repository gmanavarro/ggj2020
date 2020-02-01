extends Panel

export(PackedScene) var card_resource

var current_cards = []
func _ready():
	for i in range(6):
		add_card()


func add_card():
	var instance = card_resource.instance()
	add_child(instance)
	current_cards.append(instance)
	
	#Position Adjustment
	var count = current_cards.size()
	var i = 0
	for card in current_cards:
		#center
		card.rect_position.x = rect_position.x - card.rect_size.x/2
		card.rect_position.y = rect_position.y - card.rect_size.y
		#offset
		if count > 1:
			var delta = 1.0/(count-1.0) * i
			card.rect_position.x -= lerp(-count/2,count/2,delta) * (card.rect_size.x/count*3)
			card.rect_rotation = cos(delta*PI)*(count+PI*4)
		i += 1
