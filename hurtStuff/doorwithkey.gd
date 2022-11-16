extends KinematicBody2D


func _on_doordetect_body_entered(body):
	if "Player" in body.name:
		if(GlobalSettings.keyHave==true):
			GlobalSettings.keyHave = false
			queue_free()
		if(GlobalSettings.keyHave==false):
			pass
