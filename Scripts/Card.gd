extends Node

onready var image_texture = $Pivot/Image
onready var title_label = $Pivot/Title
onready var description_label = $Pivot/Description
onready var animation_player = $AnimationPlayer
var last_z_value  = 0
func set_data(card_data : CardsData.Card):
	image_texture.texture = card_data.image
	title_label.text = card_data.title
	description_label.text = card_data.description

func _ready():
	set_data(CardsData.get_random_card_data())

		
func mouse_entered():
	last_z_value = get_index()
	get_parent().move_child(self,get_parent().get_child_count()-1)
	animation_player.play("Touched")


func mouse_exited():
	get_parent().move_child(self,last_z_value)
	
	animation_player.play("Released")
