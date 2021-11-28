extends Node2D

var area

func _ready():
	area = $Area2D
	var bodies = area.get_overlapping_bodies()
	for body in bodies:
		if body.get_type() == "RigidBody2D":
			body.mode = RigidBody2D.MODE_STATIC
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
