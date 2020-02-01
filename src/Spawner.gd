extends Node2D

export(PackedScene) var scene

func _ready():
	var instance = scene.instance()
	add_child(instance)

func _process(delta):
	pass

