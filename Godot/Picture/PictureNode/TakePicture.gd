extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready to take picture")
	
	
func _input(event):
	if(event.is_pressed() and event.button_index == BUTTON_LEFT):
		print("registered Event")
		
		var 


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
