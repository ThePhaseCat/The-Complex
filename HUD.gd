extends CanvasLayer


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
