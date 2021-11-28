extends Node2D

func _ready():
	pass 

func get_camera_center():
	var canvas_transfrom = get_canvas_transform()
	var top_left = -canvas_transfrom.get_origin() / canvas_transfrom.get_scale()
	var size = get_viewport_rect().size * (1/2)
	return top_left + size/canvas_transfrom.get_scale()
