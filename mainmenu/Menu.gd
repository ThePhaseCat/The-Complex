extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/StartButton.grab_focus()
	GlobalSettings.toggle_borderless(Save.game_data.borderless) 
	GlobalSettings.toggle_fullscreen(Save.game_data.fullscreen)
	GlobalSettings.toggle_vsync(Save.game_data.vsync) 
	GlobalSettings.toggle_FPS(Save.game_data.display_fps)
	GlobalSettings.fps_cap(Save.game_data.fps_cap)

func _on_StartButton_pressed():
	get_tree().change_scene("res://mainmenu/levelselect/levelSelectHUD.tscn")


func _on_OptionsButton_pressed():
	get_tree().change_scene("res://mainmenu/options/Options.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_CreditsButton_pressed():
	get_tree().change_scene("res://mainmenu/credits/GodotCredits.tscn")
