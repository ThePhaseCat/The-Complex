extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if(Save.level_data.level1==true):
		$name.set_text(Save.timer_data.level1_time)


func _on_levelbasebutton_pressed():
	MainMenuMusic.stop()
	Level1Music.play()
	GlobalSettings.current_level = "level1"
	get_tree().change_scene("res://levels/level1.tscn")
