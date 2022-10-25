extends CanvasLayer

signal dieScreen()

signal timerStarted()
signal timerStopped()

signal timerSave()
signal winScreen()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Player_set_health(health_max):
	$HealthBar/ProgressBar.value = health_max

func _on_Player_new_health(new_health):
	$HealthBar/ProgressBar.value = new_health


func _on_Player_died():
	emit_signal("dieScreen")


func _on_Player_startTimer():
	emit_signal("timerStarted")


func _on_Player_stopTimer():
	emit_signal("timerStopped")


func _on_Player_win():
	emit_signal("timerSave")
	emit_signal("winScreen")
