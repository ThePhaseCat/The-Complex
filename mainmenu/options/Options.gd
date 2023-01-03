extends Control

#Video Settings
onready var fullscreen = $VBoxContainer/FullScreenButton
onready var borderless = $VBoxContainer/BorderlessButton
onready var vsync = $VBoxContainer/VSYNCButton
onready var display_fps = $VBoxContainer/FPSViewButton
onready var fps_cap = $VBoxContainer/fps_Slider
onready var aimBox = $VBoxContainer/AimBoxButton

#Audio Settings
onready var master_slider = $audioone/masterSlide
onready var music_slider = $audioone/musicSlide
onready var sfx_slider = $audioone/sfxSlide

func _ready():
	fullscreen.pressed = Save.game_data.fullscreen
	vsync.pressed =  Save.game_data.vsync
	borderless.pressed = Save.game_data.borderless
	display_fps.pressed = Save.game_data.display_fps
	aimBox.pressed = Save.game_data.aimBox
	fps_cap.value = Save.game_data.fps_cap
	
	master_slider.value = Save.game_data.master_vol
	music_slider.value = Save.game_data.music_vol
	sfx_slider.value = Save.game_data.sfx_vol



func _on_BackButton_pressed():
	Save.save_data()
	ClickSound.play()
	get_tree().change_scene("res://mainmenu/Menu.tscn")


func _on_FullScreenButton_toggled(button_pressed):
	ClickSound.play()
	GlobalSettings.toggle_fullscreen(button_pressed)


func _on_BorderlessButton_toggled(button_pressed):
	ClickSound.play()
	GlobalSettings.toggle_borderless(button_pressed)


func _on_VSYNCButton_toggled(button_pressed):
	ClickSound.play()
	GlobalSettings.toggle_vsync(button_pressed)


func _on_FPSViewButton_toggled(button_pressed):
	ClickSound.play()
	GlobalSettings.toggle_FPS(button_pressed)


func _on_fps_Slider_value_changed(value):
	GlobalSettings.fps_cap(value)
	$"fps value".set_text("FPS: " + String(value))

func _on_AimBoxButton_toggled(button_pressed):
	ClickSound.play()
	GlobalSettings.toggle_aim(button_pressed)

func _on_masterSlide_value_changed(value):
	GlobalSettings.update_master_vol(value)


func _on_musicSlide_value_changed(value):
	GlobalSettings.update_music_vol(value)


func _on_sfxSlide_value_changed(value):
	GlobalSettings.update_sfx_vol(value)

func _on_deleteData_pressed():
	ClickSound.play()
	get_tree().change_scene("res://mainmenu/delete/deleteScene.tscn")

