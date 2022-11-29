extends KinematicBody2D

var motion = Vector2()
var speed = 1
var bulletSpeed = 1500

var bulletAttack = preload("res://EnemyTeleportStuff.tscn")

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
	_timer.set_wait_time(1.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	_timer.stop()
	
	teleTime = Timer.new()
	add_child(teleTime)
	teleTime.connect("timeout", self, "_on_teleTime_timeout")
	teleTime.set_wait_time(1.0)
	teleTime.set_one_shot(false)
	teleTime.start()
	teleTime.stop()

func _on_Timer_timeout():
	fire()

func _on_teleTime_timeout():
	var random = RandomNumberGenerator.new()
	randomize()
	var cho_dir = null
	cho_dir = randi()%4+1
	if(cho_dir == 1):
		position += Vector2(randi()%50+10, randi()%50+10)
	if(cho_dir == 2):
		position -= Vector2(randi()%50+10, randi()%50+10)
	if(cho_dir == 3):
		position += Vector2(random.randi_range(-50, -10), random.randi_range(-50, -10))
	if(cho_dir == 4):
		position -= Vector2(random.randi_range(-50, -10), random.randi_range(-50, -10))
	

func _physics_process(delta):
	var motion = Vector2()
	var Player = get_parent().get_node("Player")

	look_at(Player.position)


func fire():
	var attack_instance = bulletAttack.instance()
	attack_instance.position = get_global_position()
	attack_instance.rotation_degrees = rotation_degrees
	attack_instance.apply_impulse(Vector2(), Vector2(bulletSpeed, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", attack_instance)
	yield(get_tree().create_timer(0.7), "timeout")
	get_tree().get_root().call_deferred("remove_child", attack_instance)

func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		queue_free()

func _on_PlayerDetectArea_body_entered(body):
	if "Player" in body.name:
		$Sprite.show()
		teleTime.start()
		_timer.start()

func _on_PlayerDetectArea_body_exited(body):
	if "Player" in body.name:
		$Sprite.hide()
		teleTime.stop()
		_timer.stop()
