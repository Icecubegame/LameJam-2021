extends Node2D

onready var elements = $Elements 
onready var area = $Area2D
var isDeveloping
var developingTicks
var ticksElapsed

export var aspect_ratio : float = 1
export var size : float = 1

func _ready():
	init_scale()
	init_elements_node()
	isDeveloping = true
	developingTicks = 2
	ticksElapsed = 0

func init_scale():
	var scale = Vector2(aspect_ratio*size, size)
	set_scale(scale)

func init_elements_node():
	elements.set_z_index(get_abs_z(self) - 1)
	elements.set_as_toplevel(true)
	elements.set_position(get_node("/root").get_child(0).get_position())

func _physics_process(delta):
	if ticksElapsed > developingTicks:
		isDeveloping = false
	ticksElapsed += 1

func capture_moment(node):
	for child in node.get_children():
		if child.is_in_group(PictureGlobalConfig.COMPONENT_GROUP):
			elements.add_child(child.get_image())

func get_abs_z(node):
	var z = 0
	var current_node = node
	
	while current_node and current_node is Node2D:
		z += current_node.get_z_index()
		if current_node.is_z_relative():
			current_node = current_node.get_parent()
		else:
			current_node = null
	return z

func _on_Area2D_body_entered(body):
	if isDeveloping:
		capture_moment(body)

func _on_Area2D_area_entered(area):
	if isDeveloping:
		if area.get_parent().is_in_group("Capturable"):
			capture_moment(area.get_parent())
