extends Node

func toggle_fullscreen(value):
	OS.window_fullscreen = value
	Save.game_data.fullscreen = value
	Save.save_data()

func toggle_vsync(value):
	OS.vsync_enabled = value
	Save.game_data.vsync = value
	Save.save_data()

func toggle_borderless(value):
	OS.window_borderless = value
	Save.game_data.borderless = value
	Save.save_data()

#func toggle_FPS(value):
