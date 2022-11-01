extends KinematicBody2D

var spike_status = "down"

func _ready():
	$CollisionShape2D.disabled = true
	spike_status = "down"
	spikeUp()


func spikeUp():
	$spikeAni.play("spikeUp")
	spike_status = "up"
	yield(get_tree().create_timer(3.0), "timeout")
	spikeDown()


func spikeDown():
	$spikeAni.play("spikedown")
	spike_status = "down"
	yield(get_tree().create_timer(3.0), "timeout")
	spikeUp()


func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		if spike_status == "up":
			GlobalSettings.deathSpike = true
