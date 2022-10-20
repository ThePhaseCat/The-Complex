extends Label

var running = false

var elapsed = 0;

func _process(delta):
	if (running):
		elapsed += delta;
	set_text("%0.3f" % elapsed)


func _on_HUD_timerStarted():
	running = true


func _on_HUD_timerStopped():
	running = false
