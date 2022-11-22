extends TextureButton

# Called when the node enters the scene tree for the first time.
func _ready():
	if(Save.level_data.level3==true):
		set_disabled(false)
		$name.set_text(Save.timer_data.level3_time)
	if(Save.level_data.level3==false):
		set_disabled(true)


func _on_levelbasebutton_pressed():
	if(Save.level_data.level3==false):
		pass
	if(Save.level_data.level3==true):
		GlobalSettings.current_level = "level4"
		get_tree().change_scene("res://levels/level3.tscn")
