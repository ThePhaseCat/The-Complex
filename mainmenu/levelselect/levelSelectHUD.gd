extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$level1/name.set_text("Level 1")
	$level2/name.set_text("Level 2")
	$level1/time.set_text(Save.timer_data.level1_time)
	$level2/time.set_text(Save.timer_data.level2_time)



func _on_Button_pressed():
	get_tree().change_scene("res://mainmenu/Menu.tscn")
