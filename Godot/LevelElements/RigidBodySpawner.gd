extends Node2D

export var rigidBody2D : Resource
export(int, 1, 100) var max_elements = 1
var oldest_element
var elements
var elements_node
var timer

func _ready():
	elements = []
	oldest_element = 0
	elements_node = $elements
	timer = $Timer

func _on_Timer_timeout():
	var new_rigid = rigidBody2D.instance()
	elements_node.add_child(new_rigid)
	elements.append(new_rigid)
	if elements.size() > max_elements:
		var element = elements[0]
		elements_node.remove_child(element)
		elements.erase(element)
		element.queue_free()


	
	
