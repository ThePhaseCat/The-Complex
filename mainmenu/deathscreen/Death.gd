extends CanvasLayer

func _ready():
	visible = false

func _on_QuitButton_pressed():
	get_tree().paused = false
	ClickSound.play()
	Level1Music.stop()
	Level2Music.stop()
	Level3Music.stop()
	Level4Music.stop()
	Level5Music.stop()
	Level6Music.stop()
	get_tree().change_scene("res://mainmenu/Menu.tscn")


func _on_RetryButton_pressed():
	visible=false
	ClickSound.play()
	get_tree().paused=false
	get_tree().reload_current_scene()

func _on_HUD_dieScreen():
	visible = true
	get_tree().paused = true
