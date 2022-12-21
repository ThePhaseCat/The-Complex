extends CanvasLayer

func _ready():
	visible = false

func _on_QuitButton_pressed():
	get_tree().paused = false
	Level1Music.stop()
	Level2Music.stop()
	Level3Music.stop()
	Level4Music.stop()
	Level5Music.stop()
	Level6Music.stop()
	
	Save.save_data()
	ClickSound.play()
	get_tree().change_scene("res://mainmenu/levelselect/levelSelectHUD.tscn")


func _on_RetryButton_pressed():
	visible=false
	get_tree().paused=false
	ClickSound.play()
	get_tree().reload_current_scene()

func _on_HUD_winScreen():
	visible = true
	get_tree().paused = true
