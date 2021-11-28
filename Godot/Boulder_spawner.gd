extends Node2D

var boulder_scene
var boulders
var timer

func _ready():
	boulder_scene = load("res://Boulder.tscn")
	boulders = $Boulders
	timer = $Timer

func _on_Timer_timeout():
	var new_boulder = boulder_scene.instance()
	boulders.add_child(new_boulder)
