extends Control

var picture_scene

func _ready():
	picture_scene = load("res://Picture/Picture.tscn")

func _input(event):
	if event is InputEventMouseButton:
		if Input.is_action_pressed("Capture"):
			var picture = picture_scene.instance()
			picture.set_position(get_global_mouse_position())
			add_child(picture)


