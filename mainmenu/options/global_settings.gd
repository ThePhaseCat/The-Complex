extends Node

var fps_counter = true

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

func toggle_FPS(value):
	fps_counter = value
	Save.game_data.display_fps = value
	Save.save_data()

func fps_cap(value):
	Engine.target_fps = value
	Save.game_data.fps_cap = value
	Save.save_data()
