extends Node2D

export var aspect_ratio : float = 1
export var size : float = 1

onready var picture_scene = load(PictureGlobalConfig.PICTURE_PATH)

func _ready():
	var progenitor_pos = get_progenitor(self).get_position()
	set_position(-progenitor_pos)

func _input(event):
	if event is InputEventMouseButton:
		if Input.is_action_pressed("Capture"):
			var picture = picture_scene.instance()
			picture.aspect_ratio = aspect_ratio
			picture.size = size
			picture.update_scale()
			picture.set_position(get_global_mouse_position())
			add_child(picture)

func get_progenitor(node):
	var progenitor = node
	var current_node = node
	var root = get_node("/root")
	while current_node != root:
		progenitor = current_node
		current_node = current_node.get_parent()
	return progenitor
