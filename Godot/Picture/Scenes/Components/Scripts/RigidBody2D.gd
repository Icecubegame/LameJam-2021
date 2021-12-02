extends "res://Picture/Scenes/Components/Scripts/ImageFromNode.gd"

func new_instance_of_source():
	return StaticBody2D.new()

func take_to_image():
	var image = new_instance_of_source()
	copy_propeties_from_source(image)
	for child in source_node.get_children():
		remove_from_parenet(child)
		image.add_child(child)
	return image

func default_copy_propeties(static_body):
	static_body.set_position(source_node.get_position())
	static_body.set_friction(source_node.get_friction())
	static_body.set_bounce(source_node.get_bounce())
	#TODO copy collision layer

#Z layer is off
