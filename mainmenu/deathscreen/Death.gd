extends CanvasLayer

func _ready():
	visible = false

func _on_QuitButton_pressed():
	get_tree().paused = false
	Level1Music.stop()
	Level2Music.stop()
	
	Level4Music.stop()
	get_tree().change_scene("res://mainmenu/Menu.tscn")


func _on_RetryButton_pressed():
	visible=false
	get_tree().paused=false
	get_tree().reload_current_scene()

func _on_HUD_dieScreen():
	visible = true
	get_tree().paused = true
