extends Node2D

export var staticBody2D : Resource
var instance

var on_timer
var off_timer

func _ready():
	on_timer = $OnTimer
	off_timer = $OffTimer

func _on_OnTimer_timeout():
	on_timer.stop()
	instance = staticBody2D.instance()
	add_child(instance)
	off_timer.start()

func _on_OffTimer_timeout():
	off_timer.stop()
	remove_child(instance)
	instance.queue_free()
	on_timer.start()
