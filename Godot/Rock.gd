extends Node2D


	
func _on_Area2D_body_entered(body):
	
	if body is KinematicBody2D:
		var boulder_scene = load("res://Boulder.tscn")
		var boulder = boulder_scene.instance()
		add_child(boulder)
		boulder.set_position($Position2D.get_position())
		$Area2D.queue_free()
