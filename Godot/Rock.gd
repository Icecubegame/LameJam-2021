extends Node2D


	
func _on_Area2D_body_entered(body):
	print("collision")
	if body is KinematicBody2D:
		var boulder_scene = load("res://Boulder.tscn")
		var boulder = boulder_scene.instance()
		get_node("/root").add_child(boulder)
		boulder.set_position(Vector2(1573, -587))
		$Area2D.queue_free()


