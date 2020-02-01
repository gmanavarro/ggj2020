extends Node2D

var noCollision = true
func _process(delta):
	if noCollision:
		self.set_position(Vector2(self.get_position().x +1,self.get_position().y ))


func _on_Area2D_area_entered(area):
	if area.get_name() == "nombreArea":
		noCollision = false
