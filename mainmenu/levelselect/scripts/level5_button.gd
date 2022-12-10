extends TextureButton

# Called when the node enters the scene tree for the first time.
func _ready():
	if(Save.level_data.level4==true):
		set_disabled(false)
		#$name.set_text(Save.timer_data.level5_time)
	if(Save.level_data.level4==false):
		set_disabled(true)


func _on_levelbasebutton_pressed():
	MainMenuMusic.stop()
	GlobalSettings.current_level = "level5"
	get_tree().change_scene("res://levels/level5.tscn")
