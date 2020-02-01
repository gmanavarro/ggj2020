extends Node2D

export(PackedScene) var scene

func _ready():
	spawnUnit()

func spawnUnit():
	var instance = scene.instance()
	add_child(instance)

func _process(delta):
	pass

