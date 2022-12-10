extends Control

signal options()

func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


func _on_ResumeButton_pressed():
	visible = false
	get_tree().paused = false

func _on_QuitButton_pressed():
	Level1Music.stop()
	Level2Music.stop()
	
	Level4Music.stop()
	get_tree().paused = false
	get_tree().change_scene("res://mainmenu/Menu.tscn")


func _on_RetryButtom_pressed():
	visible = false
	get_tree().paused = false
	get_tree().reload_current_scene()
