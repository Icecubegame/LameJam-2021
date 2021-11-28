extends Node2D

var flash
var animation
var film_shader

func _ready():
	init_flash()
	animation.play("Polaroid_Develop")
	film_shader

func init_flash():
	flash = $ColorRect
	animation = $AnimationPlayer

func _on_AnimationPlayer_animation_finished(anim_name):
	animation.stop(false)
	animation.queue_free()
	queue_free()
