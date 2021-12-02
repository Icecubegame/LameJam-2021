extends Node2D

export(String) var name_of_image

func _ready():
	add_to_group(PictureGlobalConfig.COMPONENT_GROUP)

func get_image():
	var image = Node2D.new()
	image.set_name("image_" + name)
	get_child_image(image)
	return image

func get_child_image(node):
	for child in get_children():
		child.set_owner(self)
		node.add_child(child.get_image())

func delete_node(node):
	if node.has_method("capture_delete"):
		node.capture_delete()
	else:
		node.queue_free()

func remove_from_parenet(node):
	if node.has_method("capture_remove_from_parenet"):
		node.capture_remove_from_parenet()
	else:
		node.get_parent().remove_child(node)
