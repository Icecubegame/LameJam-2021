extends KinematicBody2D

export(float) var move_speed = 250
export(float) var jump_impulse = 1000
export(float) var gravity = 100

onready var _animated_sprite = $AnimatedSprite
onready var in_air = false

var velocity : Vector2

func _animate_movement(next_move):
	if in_air and next_move.y > 0:
		_animated_sprite.play("fall")
	elif in_air and next_move.y < 0:
		_animated_sprite.play("jump")
	else:
		_animated_sprite.play("run")

func _physics_process(delta):
	
	var axis = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	
	var is_jump_pressed = Input.is_action_just_pressed("jump")
	
	var next_move = velocity
	
	next_move.x = axis.x * move_speed
	
	next_move.y += gravity
	
	if(self.is_on_floor() && is_jump_pressed):
		in_air = true
		next_move.y -= jump_impulse
	
	velocity = move_and_slide_with_snap(next_move, Vector2.DOWN, Vector2.UP)
	
	if Input.is_action_pressed("ui_left"):
		_animated_sprite.flip_h = true
		_animate_movement(next_move)
	elif Input.is_action_pressed("ui_right"):
		_animated_sprite.flip_h = false
		_animate_movement(next_move)
	elif !self.is_on_floor():
		_animate_movement(next_move)
	else:
		_animated_sprite.play("idle")
	
	if(self.is_on_floor()):
		in_air = false
