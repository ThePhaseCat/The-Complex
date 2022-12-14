extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if(GlobalSettings.menuMusicPlaying == true && MainMenuMusic.playing == false):
		MainMenuMusic.play()
	if (MainMenuMusic.playing == true):
		pass
	GlobalSettings.toggle_borderless(Save.game_data.borderless) 
	GlobalSettings.toggle_fullscreen(Save.game_data.fullscreen)
	GlobalSettings.toggle_vsync(Save.game_data.vsync) 
	GlobalSettings.toggle_FPS(Save.game_data.display_fps)
	GlobalSettings.fps_cap(Save.game_data.fps_cap)
	GlobalSettings.update_master_vol(Save.game_data.master_vol)
	GlobalSettings.update_music_vol(Save.game_data.music_vol)
	GlobalSettings.update_sfx_vol(Save.game_data.sfx_vol)
	GlobalSettings.toggle_aim(Save.game_data.aimBox)

func _on_StartButton_pressed():
	ClickSound.play()
	get_tree().change_scene("res://mainmenu/levelselect/levelSelectHUD.tscn")


func _on_OptionsButton_pressed():
	ClickSound.play()
	get_tree().change_scene("res://mainmenu/options/Options.tscn")


func _on_QuitButton_pressed():
	ClickSound.play()
	get_tree().quit()


func _on_CreditsButton_pressed():
	ClickSound.play()
	get_tree().change_scene("res://mainmenu/credits/GodotCredits.tscn")
