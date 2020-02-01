extends Panel

export(PackedScene) var card_resource

var current_cards = []
func _ready():
	GameManager.DECK = self
	for i in range(1):
		add_card(CardsData.get_random_card_data())


func _input(event):
	if event is InputEventKey:
		if event.pressed:
			if event.scancode == KEY_C:
				add_card(CardsData.get_random_card_data())
			if event.scancode == KEY_F:
				remove_all_cards()
func add_card(card_data : CardsData.Card):
	var instance = card_resource.instance()
	add_child(instance)
	instance.set_data(CardsData.get_random_card_data())
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
		card.rearrange()
		
	
func remove_all_cards():
	while(current_cards.size() > 0):
		current_cards[0].queue_free()
		current_cards.remove(0)
func remove_card():
	pass

func deselect_all_cards():
	for card in current_cards:
		card.deslect()
