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
		Save.level_data.level1 = true
		if (Save.timer_data.level1_time == "0"):
			Save.timer_data.level1_time = trueTime
			#Save.save_data()
		if (Save.timer_data.level1_time >= trueTime):
			Save.timer_data.level1_time = trueTime
			#Save.save_data()
		if (Save.timer_data.level1_time <= trueTime):
			pass
	if (level == "level2"):
		Save.level_data.level2 = true
		if (Save.timer_data.level2_time == "0"):
			Save.timer_data.level2_time = trueTime
			#Save.save_data()
		if (Save.timer_data.level2_time >= trueTime):
			Save.timer_data.level2_time = trueTime
			#Save.save_data()
		if (Save.timer_data.level2_time <= trueTime):
			pass
	if (level == "level3"):
		Save.level_data.level3 = true
		if (Save.timer_data.level3_time == "0"):
			Save.timer_data.level3_time = trueTime
			#Save.save_data()
		if (Save.timer_data.level3_time >= trueTime):
			Save.timer_data.level3_time = trueTime
			#Save.save_data()
		if (Save.timer_data.level3_time <= trueTime):
			pass
	if (level == "level4"):
		Save.level_data.level4 = true
		if (Save.timer_data.level4_time == "0"):
			Save.timer_data.level4_time = trueTime
			#Save.save_data()
		if (Save.timer_data.level4_time >= trueTime):
			Save.timer_data.level4_time = trueTime
			#Save.save_data()
		if (Save.timer_data.level4_time <= trueTime):
			pass
	if (level == "level5"):
		Save.level_data.level5 = true
		if (Save.timer_data.level5_time == "0"):
			Save.timer_data.level5_time = trueTime
			#Save.save_data()
		if (Save.timer_data.level5_time >= trueTime):
			Save.timer_data.level5_time = trueTime
			#Save.save_data()
		if (Save.timer_data.level5_time <= trueTime):
			pass
	if (level == "level6"):
		Save.level_data.level6 = true
		if (Save.timer_data.level6_time == "0"):
			Save.timer_data.level6_time = trueTime
			#Save.save_data()
		if (Save.timer_data.level6_time >= trueTime):
			Save.timer_data.level6_time = trueTime
			#Save.save_data()
		if (Save.timer_data.level6_time <= trueTime):
			pass
	
	Save.save_data()
