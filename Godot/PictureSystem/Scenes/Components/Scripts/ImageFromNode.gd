extends "res://Picture/Scenes/Components/Scripts/Capturable.gd"

enum MODE {copy, take, copy_and_remove}
export(MODE) var mode
export(NodePath) var source_node_path
var source_node

func _ready():
	source_node = get_node(source_node_path)
	if name_of_image == "":
		name_of_image = source_node.get_name()

func get_image():
	var image 
	match mode: 
		MODE.copy:
			image = copy_to_image()
		MODE.take:
			image = take_to_image()
		MODE.copy_and_remove:
			image = copy_and_remove_to_image()
	image.set_name("image_" + name)
	return image

func copy_to_image():
	var image = new_instance_of_source()
	copy_propeties_from_source(image)
	get_child_image(image)
	return image

func take_to_image():
	var image = source_node
	remove_from_parenet(image)
	return image

func copy_and_remove_to_image():
	var image = copy_to_image()
	delete_node(source_node)
	return image

func copy_propeties_from_source(image):
	if source_node.has_method("capture_copy_propeties"):
		source_node.capture_copy_propeties(image)
	else:
		default_copy_propeties(image)

func new_instance_of_source():
	pass

func default_copy_propeties(image):
	pass
