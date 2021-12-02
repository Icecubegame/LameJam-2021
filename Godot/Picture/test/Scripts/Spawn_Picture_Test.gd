extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var hasSpawnd

# Called when the node enters the scene tree for the first time.
func _ready():
	hasSpawnd = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_body_entered(body):
	$Area2D.queue_free()
	if !hasSpawnd:
		print("spawn")
		hasSpawnd = true
		var picture_scene = load(PictureGlobalConfig.PICTURE_PATH)
		var picture = picture_scene.instance()
		picture.set_position($Position2D.get_position())
		add_child(picture)
