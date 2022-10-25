extends Control

#Video Settings
onready var fullscreen = $VBoxContainer/FullScreenButton
onready var borderless = $VBoxContainer/BorderlessButton
onready var vsync = $VBoxContainer/VSYNCButton
onready var display_fps = $VBoxContainer/FPSViewButton
onready var fps_cap = $VBoxContainer/fps_Slider

func _ready():
	fullscreen.pressed = Save.game_data.fullscreen
	vsync.pressed =  Save.game_data.vsync
	borderless.pressed = Save.game_data.borderless
	display_fps.pressed = Save.game_data.display_fps
	fps_cap.value = Save.game_data.fps_cap



func _on_BackButton_pressed():
	get_tree().change_scene("res://mainmenu/Menu.tscn")


func _on_FullScreenButton_toggled(button_pressed):
	GlobalSettings.toggle_fullscreen(button_pressed)


func _on_BorderlessButton_toggled(button_pressed):
	GlobalSettings.toggle_borderless(button_pressed)


func _on_VSYNCButton_toggled(button_pressed):
	GlobalSettings.toggle_vsync(button_pressed)


func _on_FPSViewButton_toggled(button_pressed):
	GlobalSettings.toggle_FPS(button_pressed)


func _on_fps_Slider_value_changed(value):
	GlobalSettings.fps_cap(value)
	$"fps value".set_text("FPS: " + String(value))
