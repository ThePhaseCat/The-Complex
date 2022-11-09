extends Control


func _on_yes_pressed():
	Save.level_data.level1 = false
	Save.level_data.level2 = false
	Save.level_data.level3 = false
	Save.level_data.level4 = false
	Save.level_data.level5 = false
	Save.level_data.level6 = false
	Save.level_data.level7 = false
	Save.level_data.level8 = false
	Save.level_data.level9 = false
	Save.level_data.level10 = false
	Save.level_data.level11 = false
	Save.level_data.level12 = false
	Save.level_data.level13 = false
	Save.level_data.level14 = false
	Save.level_data.level15 = false
	Save.timer_data.level1_time = "0"
	Save.timer_data.level2_time = "0"
	Save.timer_data.level3_time = "0"
	Save.timer_data.level4_time = "0"
	Save.timer_data.level5_time = "0"
	Save.timer_data.level6_time = "0"
	Save.timer_data.level7_time = "0"
	Save.timer_data.level8_time = "0"
	Save.timer_data.level9_time = "0"
	Save.timer_data.level10_time = "0"
	Save.timer_data.level11_time = "0"
	Save.timer_data.level12_time = "0"
	Save.timer_data.level13_time = "0"
	Save.timer_data.level14_time = "0"
	Save.timer_data.level15_time = "0"
	Save.save_data()
	get_tree().change_scene("res://mainmenu/options/Options.tscn")


func _on_no_pressed():
	get_tree().change_scene("res://mainmenu/options/Options.tscn")
