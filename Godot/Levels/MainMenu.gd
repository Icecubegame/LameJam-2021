extends MarginContainer

const Level1 = preload("res://Levels/Level1.tscn")
#const CREDITS = preload("res://CREDITS.tscn")


onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Selector



var current_selection = 0

func _ready():
	set_current_selection(0)
	print(get_node("/root").get_children())
	
func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 1:
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		current_selection -= 1
		set_current_selection(current_selection)	
	elif Input.is_action_just_pressed("ui_accept"):
		_handle_selection(current_selection)
	
func _handle_selection(_current_selection):
	if	_current_selection == 0:
		get_parent().add_child(Level1.instance())
		get_parent().remove_child(self)
		queue_free()
	elif _current_selection ==1:
		get_tree().quit()
	
			

func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	if _current_selection == 0:
		selector_one.text = ">"
	elif _current_selection == 1:
		selector_two.text = ">"
	
	
