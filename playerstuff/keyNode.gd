extends KinematicBody2D

func _ready():
	pass

func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		if (GlobalSettings.keyHave==false):
			GlobalSettings.keyHave = true
			yield(get_tree().create_timer(0.1), "timeout")
			queue_free()
		if (GlobalSettings.keyHave==true):
			pass
