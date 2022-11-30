extends KinematicBody2D

func _ready():
	GlobalSettings.wallCharge = false


func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		if (GlobalSettings.wallCharge == false):
			print("wall not active")
		if (GlobalSettings.wallCharge == true):
			GlobalSettings.wallCharge = false
