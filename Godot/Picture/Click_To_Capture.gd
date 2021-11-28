extends Node2D

var picture_scene

func _ready():
	picture_scene = load("res://Picture/Picture.tscn")

func _input(event):
	if Input.is_action_pressed("Capture"):
		if event is InputEventMouseButton:
			var picture = picture_scene.instance()
			picture.set_position(event.position)
			add_child(picture)


