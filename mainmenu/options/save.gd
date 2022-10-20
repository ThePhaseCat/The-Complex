extends Node

const SAVEFILE = "user://SAVEFILE.save"

var game_data = {}
var timer_data = {}

func _ready():
	load_data()

func load_data():
	var file = File.new()
	if not file.file_exists(SAVEFILE):
		game_data ={
			"fullscreen": false,
			"borderless": false,
			"vsync": false,
			"display_fps": true,
			"fps_cap": 60,
		}
		timer_data ={
			"level1_time": "0",
			"level2_time": "0",
		}
		save_data()
	file.open(SAVEFILE, File.READ)
	game_data = file.get_var()
	timer_data = file.get_var()
	file.close()

func save_data():
	var file = File.new()
	file.open(SAVEFILE, File.WRITE)
	file.store_var(game_data)
	file.store_var(timer_data)
	file.close()
