extends Control

export var aspect_ratio : float = 1
export var size : float = 1

onready var picture_scene = load(PictureGlobalConfig.PICTURE_PATH)

func _ready():
	set_position(get_node("/root").get_child(0).get_position())

func _input(event):
	if event is InputEventMouseButton:
		if Input.is_action_pressed("Capture"):
			var picture = picture_scene.instance()
			picture.aspect_ratio = aspect_ratio
			picture.size = size
			picture.set_position(get_global_mouse_position())
			print(get_global_mouse_position())
			add_child(picture)
