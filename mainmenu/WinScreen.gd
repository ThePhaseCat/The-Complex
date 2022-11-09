extends CanvasLayer

func _ready():
	visible = false

func _on_QuitButton_pressed():
	get_tree().paused = false
	var level = GlobalSettings.current_level
	if(level == "level1"):
		Save.level_data.level1 = true
	
	Save.save_data()
	get_tree().change_scene("res://mainmenu/levelselect/levelSelectHUD.tscn")


func _on_RetryButton_pressed():
	visible=false
	get_tree().paused=false
	get_tree().reload_current_scene()

func _on_HUD_winScreen():
	visible = true
	get_tree().paused = true
