extends Node2D

onready var area = $Area2D
var isDeveloping
var developingTicks
var ticksElapsed

export var aspect_ratio : float = 1
export var size : float = 1

func _ready():
	init_scale()
	init_elements_node()
	isDeveloping = true
	developingTicks = 2
	ticksElapsed = 0

func init_scale():
	var scale = Vector2(aspect_ratio*size, size)
	set_scale(scale)

func init_elements_node():
	var elements = $Elements
	elements.set_z_index(get_abs_z(self) - 1)
	elements.set_as_toplevel(true)
	elements.set_position(get_node("/root").get_child(0).get_position())

func get_abs_z(targ):
	var z = 0
	var node = targ
	
	while node and node is Node2D:
		z += node.get_z_index()
		if !node.is_z_relative():
			break
		node = node.get_parent()
	return z

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if ticksElapsed > developingTicks:
		isDeveloping = false
		
	ticksElapsed += 1

func freeze(body):
	var isCapturable = body is RigidBody2D or body.is_in_group("Capturable")
	
	if isCapturable and (not body.is_in_group("NotCapturable")):
		print("Captured")
		var current_bodies = []
		current_bodies.append(body)
		var current_body = current_bodies[0]
		
		while current_bodies:
			print(current_bodies)
			current_body = current_bodies[0]
			if current_body is RigidBody2D:
				$Elements.add_child(rigid_to_static(current_body))
				current_bodies.erase(current_body)
			elif current_body is StaticBody2D:
				$Elements.add_child(current_body.duplicate())
				current_bodies.erase(current_body)
			else:
				for childern in current_body.get_children():
					current_bodies.append(childern)
				current_bodies.erase(current_body)
		
		if body.is_in_group("CustomFree"):
			body.free_child(current_body)
		elif body.get_parent().is_in_group("CustomFree"):
			body.get_parent().free_child(current_body)
		else:
			body.queue_free()
		#Jeez I wished this worked (icecube)
		#body.set_mode(RigidBody2D.MODE_STATIC)

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
		freeze(body)

func _on_Area2D_area_entered(area):
	if isDeveloping:
		if area.get_parent().is_in_group("Capturable"):
			freeze(area.get_parent())
