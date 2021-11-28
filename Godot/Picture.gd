extends Node2D

var area
var isDeveloping
var developingTicks
var ticksElapsed

func _ready():
	init_Elements()
	area = $Area2D
	isDeveloping = true
	developingTicks = 2
	ticksElapsed = 0

func init_Elements():
	var elements = $Elements
	elements.set_as_toplevel(true)
	elements.set_position(get_node("/root").get_child(0).get_position())
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	ticksElapsed += 1
	if ticksElapsed >= developingTicks:
		isDeveloping = false

func freeze(body):
	if body is RigidBody2D:
		print(body.get_position())
		$Elements.add_child(rigid_to_static(body))
		body.queue_free()
		
		#Jeez I wished this worked (icecube)
		#body.set_mode(RigidBody2D.MODE_RIGID)

func rigid_to_static(body):
	var staticBody = StaticBody2D.new()
	copy_physical_and_visual_children(staticBody, body)
	copy_body_propeties(staticBody, body)
	return staticBody

func copy_body_propeties(dest, targ):
	dest.set_name(targ.get_name())
	dest.set_position(targ.get_position())
	dest.set_friction(targ.get_friction())
	dest.set_bounce(targ.get_bounce())

func copy_physical_and_visual_children(dest, targ):
	for child in targ.get_children():
		match child.get_class():
			"CollisionShape2D", "CollisionPolyon2D":
				dest.add_child(child.duplicate())
			"AnimatedSprite", "Sprite":
				dest.add_child(child.duplicate())
			_:
				pass

func _on_Area2D_body_entered(body):
	if isDeveloping:
		print(body.get_position())
		print("freeze")
		freeze(body)
