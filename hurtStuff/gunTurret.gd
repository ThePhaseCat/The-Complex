extends KinematicBody2D

var motion = Vector2()
var health = 50
var speed = 1
var bulletSpeed = 500

var bulletAttack = preload("res://hurtStuff/turretGunStuff.tscn")

var _timer = null
var pTime = null

func _ready():
	health = 50
	$turretdestory.hide()
	$enemyaboutto.hide()
	set_physics_process(true)
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	_timer.stop()
	pTime = Timer.new()
	add_child(pTime)
	pTime.connect("timeout", self, "pTimeout")
	pTime.set_wait_time(0.5)
	pTime.set_one_shot(false) # Make sure it loops
	pTime.start()
	pTime.stop()

func _on_Timer_timeout():
	fire()
	pTime.start()

func pTimeout():
	$enemyaboutto.show()
	pTime.stop()
	yield(get_tree().create_timer(0.3), "timeout")
	$enemyaboutto.hide()

func _physics_process(delta):
	var Player = get_parent().get_node("Player")
	look_at(Player.position)

func fire():
	var attack_instance = bulletAttack.instance()
	attack_instance.position = get_global_position()
	attack_instance.rotation_degrees = rotation_degrees
	attack_instance.apply_impulse(Vector2(), Vector2(bulletSpeed, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", attack_instance)
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().get_root().call_deferred("remove_child", attack_instance)

func health_change():
	health = health - 25

func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		if health <= 0:
			$turretdestory.show()
			set_physics_process(false)
			$Tween.stop_all()
			$Tween.interpolate_property($Sprite,'modulate:a',$Sprite.get_modulate().a, 0.0,0.25,Tween.TRANS_SINE,Tween.EASE_OUT)
			$Tween.start()
			yield($Tween, 'tween_completed')
			queue_free()
		else:
			health_change()
			yield(get_tree().create_timer(0.5), "timeout")

func _on_PlayerDetectArea_body_entered(body):
	if "Player" in body.name:
		_timer.start()
		pTime.start()


func _on_PlayerDetectArea_body_exited(body):
	if "Player" in body.name:
		_timer.stop()
		pTime.stop()
