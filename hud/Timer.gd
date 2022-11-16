extends Label

var running = false

var elapsed = 0;

var trueTime = 0;

func _process(delta):
	if (running):
		elapsed += delta;
	trueTime = ("%0.3f" % elapsed)
	set_text(trueTime)


func _on_HUD_timerStarted():
	running = true


func _on_HUD_timerStopped():
	running = false


func _on_HUD_timerSave():
	var level = GlobalSettings.current_level
	if (level == "level1"):
		if (Save.timer_data.level1_time == "0"):
			Save.game_data.level1 = true
			Save.timer_data.level1_time = trueTime
			#Save.save_data()
		if (Save.timer_data.level1_time >= trueTime):
			Save.timer_data.level1_time = trueTime
			#Save.save_data()
		if (Save.timer_data.level1_time <= trueTime):
			pass
	if (level == "level2"):
		if (Save.timer_data.level2_time == "0"):
			Save.game_data.level2 = true
			Save.timer_data.level2_time = trueTime
			#Save.save_data()
		if (Save.timer_data.level2_time >= trueTime):
			Save.timer_data.level2_time = trueTime
			#Save.save_data()
		if (Save.timer_data.level2_time <= trueTime):
			pass
	
	Save.save_data()
