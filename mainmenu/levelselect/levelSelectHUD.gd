extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$level1/name.set_text("Level 1")
	$level2/name.set_text("Level 2")
	$level3/name.set_text("Level 3")
	$level4/name.set_text("Level 4")
	$level5/name.set_text("Level 5")
	$level6/name.set_text("Level 6")
	$level1/time.set_text(Save.timer_data.level1_time)
	$level2/time.set_text(Save.timer_data.level2_time)
	$level3/time.set_text(Save.timer_data.level3_time)
	$level4/time.set_text(Save.timer_data.level4_time)
	$level5/time.set_text(Save.timer_data.level5_time)
	$level6/time.set_text(Save.timer_data.level6_time)
	print(Save.level_data.level4)



func _on_Button_pressed():
	get_tree().change_scene("res://mainmenu/Menu.tscn")
