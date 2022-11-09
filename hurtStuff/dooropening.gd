extends KinematicBody2D

func _on_buttondetect_body_entered(body):
	if "Player" in body.name:
		doorOpen()

func doorOpen():
	queue_free()
