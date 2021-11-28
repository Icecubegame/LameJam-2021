extends StaticBody2D


func _ready():
	visible = true
	get_node("CollisionShape2D").disabled = false


func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		queue_free()
