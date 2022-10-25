extends Area2D

func _on_teleport_body_entered(body):
	if "Player" in body.name:
		var level = GlobalSettings.current_level
		get_tree().change_scene("res://mainmenu/levelselect/levelSelectHUD.tscn")
