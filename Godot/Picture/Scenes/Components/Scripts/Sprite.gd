extends "res://Picture/Scenes/Components/Scripts/ImageFromNode.gd"

func copy_to_image():
	#NOTE: duplicate is not generally recommended 
	return source_node.duplicate()

func default_copy_propeties(new_shape):
	pass #TODO implement copy method for CollisionShape2D
