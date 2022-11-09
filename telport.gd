extends Area2D

func _on_teleport_body_entered(body):
	if "Player" in body.name:
		var level = GlobalSettings.current_level
		if(level == "level1"):
			print("test")
			Save.level_data.level1 = true
			Save.save_data()
		get_tree().change_scene("res://mainmenu/levelselect/levelSelectHUD.tscn")
