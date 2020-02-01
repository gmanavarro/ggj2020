extends Control

onready var image_texture = $Pivot/Image
onready var title_label = $Pivot/Title
onready var description_label = $Pivot/Description
onready var animation_player = $AnimationPlayer
onready var arrow_line = $Node/ArrowLine
onready var arrow_end = $Node/ArrowEnd

var last_z_value  = 0
var selected = false
var data
func set_data(card_data : CardsData.Card):
	data = card_data
	image_texture.texture = card_data.image
	title_label.text = card_data.title
	description_label.text = card_data.description

func _ready():
	animation_player.play("Spawn")

func _process(delta):
	if selected:
		arrow_line.points[0] = rect_global_position + rect_size/2
		arrow_line.points[1] = get_global_mouse_position()
		arrow_end.global_position = get_global_mouse_position()
		
		
func mouse_entered():
	last_z_value = get_index()
	get_parent().move_child(self,get_parent().get_child_count()-1)
	animation_player.play("Touched")


func mouse_exited():
	get_parent().move_child(self,last_z_value)
	animation_player.play("Released")

func deslect():
	set_selection(false)
func rearrange():
	pass
func set_selection(value):
	selected = value
	arrow_line.visible = selected
	arrow_end.visible = selected
	if selected:
		Hand.holded_card = self
	else:
		Hand.holded_card = null
func pressed():
	var previous_state = selected
	GameManager.DECK.deselect_all_cards()
	set_selection(!previous_state)
	
