extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(Save.timer_data.level1_time)
	$level1/time.set_text(Save.timer_data.level1_time)



func _on_Button_pressed():
	get_tree().change_scene("res://mainmenu/Menu.tscn")
