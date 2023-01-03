extends Node

var menuMusicPlaying = true

var fps_counter = true
var aimShow = true
var current_level = "n/a"
var deathSpike = false
var keyHave = false
var wallCharge = false

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

func toggle_aim(value):
	aimShow = value
	Save.game_data.aimBox = value
	Save.save_data()

func update_master_vol(vol):
	AudioServer.set_bus_volume_db(0, vol)
	Save.game_data.master_vol = vol
	Save.save_data()

func update_music_vol(vol):
	AudioServer.set_bus_volume_db(1, vol)
	Save.game_data.music_vol = vol
	Save.save_data()

func update_sfx_vol(vol):
	AudioServer.set_bus_volume_db(2, vol)
	Save.game_data.sfx_vol = vol
	Save.save_data()
