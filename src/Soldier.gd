extends Unit

var noCollision = true
func _process(delta):
	if noCollision:
		self.set_position(Vector2(self.get_position().x +0.1,self.get_position().y ))


func _on_Area2D_area_entered(area):
	if area.get_name() == "Detector":
		noCollision = false
	resolveCombat(area.get_parent().itemEquipped)
	
