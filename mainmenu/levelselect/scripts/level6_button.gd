extends TextureButton

# Called when the node enters the scene tree for the first time.
func _ready():
	if(Save.level_data.level5==true):
		set_disabled(false)
		$name.set_text(Save.timer_data.level6_time)
	if(Save.level_data.level5==false):
		set_disabled(true)


func _on_levelbasebutton_pressed():
	MainMenuMusic.stop()
	if(Save.level_data.level5==false):
		pass
	if(Save.level_data.level5==true):
		GlobalSettings.current_level = "level6"
		get_tree().change_scene("res://levels/level6.tscn")
