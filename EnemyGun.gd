extends KinematicBody2D

var motion = Vector2()
var speed = 0
var bulletSpeed = 600

var bulletAttack = preload("res://EnemyGunStuff.tscn")

var _timer = null
var pTime = null

func _ready():
	$Sprite.hide()
	$enemydefeatring.hide()
	$enemyaboutto.hide()
	set_physics_process(true)
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1.2)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.stop()
	pTime = Timer.new()
	add_child(pTime)
	pTime.connect("timeout", self, "pTimeout")
	pTime.set_wait_time(0.6)
	pTime.set_one_shot(false) # Make sure it loops
	pTime.start()
	pTime.stop()

func _on_Timer_timeout():
	fire()
	pTime.start()

func pTimeout():
	$enemyaboutto.show()
	pTime.stop()
	yield(get_tree().create_timer(0.5), "timeout")
	$enemyaboutto.hide()

func _physics_process(delta):
	var motion = Vector2()
	var Player = get_parent().get_node("Player")

	motion += (Vector2(Player.position) - position)
	look_at(Player.position)

	motion = motion.normalized() * speed
	move_and_collide(motion)

func fire():
	var attack_instance = bulletAttack.instance()
	attack_instance.position = get_global_position()
	attack_instance.rotation_degrees = rotation_degrees
	attack_instance.apply_impulse(Vector2(), Vector2(bulletSpeed, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", attack_instance)
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().get_root().call_deferred("remove_child", attack_instance)

func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		$enemydefeatring.show()
		set_physics_process(false)
		$Tween.stop_all()
		$Tween.interpolate_property($Sprite,'modulate:a',$Sprite.get_modulate().a, 0.0,0.25,Tween.TRANS_SINE,Tween.EASE_OUT)
		$Tween.start()
		yield($Tween, 'tween_completed')
		queue_free()


func _on_PlayerDetectArea_body_entered(body):
	if "Player" in body.name:
		$Sprite.show()
		speed = 0

func _on_PlayerDetectArea_body_exited(body):
	if "Player" in body.name:
		$Sprite.hide()
		speed = 1


func _on_PlayerShootingRange_body_entered(body):
	if "Player" in body.name:
		_timer.start()
		pTime.start()
		print("In range for shooting")


func _on_PlayerShootingRange_body_exited(body):
	if "Player" in body.name:
		_timer.stop()
		pTime.stop()
		print("Left shooting range")


func _on_BeginMoveArea_body_entered(body):
	if "Player" in body.name:
		speed = 1


func _on_BeginMoveArea_body_exited(body):
	if "Player" in body.name:
		speed = 0
