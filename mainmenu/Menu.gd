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

func _on_StartButton_pressed():
	get_tree().change_scene("res://world.tscn")


func _on_OptionsButton_pressed():
	get_tree().change_scene("res://mainmenu/options/Options.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_CreditsButton_pressed():
	pass # Replace with function body.
