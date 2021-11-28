extends CanvasLayer

var flash
var animation

func _ready():
	init_flash()
	animation.play("Picture_Flash")


func init_flash():
	flash = $flash/ColorRect
	animation = $flash/AnimationPlayer
	flash.set_position(get_parent().get_camera_center())

func _on_AnimationPlayer_animation_finished(anim_name):
	animation.stop(false)
	animation.queue_free()
	queue_free()
