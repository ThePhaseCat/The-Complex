extends Node

const SAVEFILE = "user://SAVEFILE.save"

var game_data = {}
var level_data = {}
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
			"master_vol": -10,
			"music_vol": -10,
			"sfx_vol": -10,
		}
		level_data={
			"level1": false,
			"level2": false,
			"level3": false,
			"level4": false,
			"level5": false,
			"level6": false,
			"level7": false,
			"level8": false,
			"level9": false,
			"level10": false,
			"level11": false,
			"level12": false,
			"level13": false,
			"level14": false,
			"level15": false,
		}
		timer_data ={
			"level1_time": "0",
			"level2_time": "0",
			"level3_time": "0",
			"level4_time": "0",
			"level5_time": "0",
			"level6_time": "0",
			"level7_time": "0",
			"level8_time": "0",
			"level9_time": "0",
			"level10_time": "0",
			"level11_time": "0",
			"level12_time": "0",
			"level13_time": "0",
			"level14_time": "0",
			"level15_time": "0",
		}
		save_data()
	file.open(SAVEFILE, File.READ)
	game_data = file.get_var()
	level_data = file.get_var()
	timer_data = file.get_var()
	file.close()

func save_data():
	var file = File.new()
	file.open(SAVEFILE, File.WRITE)
	file.store_var(game_data)
	file.store_var(level_data)
	file.store_var(timer_data)
	file.close()
