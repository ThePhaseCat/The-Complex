extends KinematicBody2D

func _ready():
	GlobalSettings.deathSpike = false
	pass

func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		GlobalSettings.deathSpike = true
