extends TextureButton

# Called when the node enters the scene tree for the first time.
func _ready():
	if(Save.level_data.level1==true):
		set_disabled(false)
		$name.set_text(Save.timer_data.level2_time)
	if(Save.level_data.level1==false):
		set_disabled(true)


func _on_levelbasebutton_pressed():
	if(Save.level_data.level1==false):
		pass
	if(Save.level_data.level1==true):
		GlobalSettings.current_level = "level2"
		get_tree().change_scene("res://levels/level1.tscn")
