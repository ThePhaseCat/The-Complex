extends KinematicBody2D

var motion = Vector2()
var speed = 1
var bulletSpeed = 500

var bulletAttack = preload("res://EnemyGunStuff.tscn")

var _timer = null
var teleTime = null

var randomX = 0
var randomY = 0

var random = false

func _ready():
	$Sprite.hide()
	set_physics_process(true)
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(3.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	
	teleTime = Timer.new()
	add_child(teleTime)
	teleTime.connect("timeout", self, "_on_teleTime_timeout")
	teleTime.set_wait_time(2.0)
	teleTime.set_one_shot(false)
	teleTime.start()

func _on_Timer_timeout():
	fire()

func _on_teleTime_timeout():
	randomPoint()

func _physics_process(delta):
	var motion = Vector2()
	var Player = get_parent().get_node("Player")

	motion += (Vector2(Player.position) - position)
	look_at(Player.position)

	motion = motion.normalized() * speed
	move_and_collide(motion)
	
	motion.x += randomX
	motion.y += randomY

func fire():
	var attack_instance = bulletAttack.instance()
	attack_instance.position = get_global_position()
	attack_instance.rotation_degrees = rotation_degrees
	attack_instance.apply_impulse(Vector2(), Vector2(bulletSpeed, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", attack_instance)
	yield(get_tree().create_timer(0.3), "timeout")
	get_tree().get_root().call_deferred("remove_child", attack_instance)

func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		queue_free()

func _on_PlayerDetectArea_body_entered(body):
	if "Player" in body.name:
		$Sprite.show()

func _on_PlayerDetectArea_body_exited(body):
	if "Player" in body.name:
		$Sprite.hide()

func randomPoint():
	randomize()
	var X = randi()%500+100
	var Y = randi()%500+100
	randomX = X
	randomY = Y
	
	yield(get_tree().create_timer(0.1), "timeout")
	randomX = 0
	randomY = 0
	print("Should have teleported")
