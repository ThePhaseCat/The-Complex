extends Node

const SAVEFILE = "user://TIMERDATA.save"

var timer_data = {}

func _ready():
	load_data()

func load_data():
	var file = File.new()
	if not file.file_exists(SAVEFILE):
		timer_data ={
			"level1_time": "0",
			"level2_time": 0,
		}
		save_data()
	file.open(SAVEFILE, File.READ)
	timer_data = file.get_var()
	file.close()

func save_data():
	var file = File.new()
	file.open(SAVEFILE, File.WRITE)
	file.store_var(timer_data)
	file.close()
