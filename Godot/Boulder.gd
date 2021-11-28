extends RigidBody2D

is_able_to_sleep()

func _ready():
	
	set_can_sleep(true)
	

func _on_Area2D_body_entered(body):
	
	set_can_sleep(false)
