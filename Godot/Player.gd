extends KinematicBody2D

export(float) var move_speed = 250
export(float) var jump_impulse = 1000
export(float) var gravity = 100

var velocity : Vector2

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
		next_move.y -= jump_impulse
	
	velocity = move_and_slide_with_snap(next_move, Vector2.DOWN, Vector2.UP)
