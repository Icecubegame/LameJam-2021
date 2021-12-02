extends Node2D

func _ready():
	pass 

func get_camera_center():
	var canvas_transfrom = get_canvas_transform()
	var top_left = -canvas_transfrom.get_origin() / canvas_transfrom.get_scale()
	var size = get_viewport_rect().size * (1/2)
	return top_left + size/canvas_transfrom.get_scale()

func get_camera_scale():
	var view_transform_scale = get_canvas_transform().get_scale()
	return Vector2(1/view_transform_scale.x, 1/view_transform_scale.y)
