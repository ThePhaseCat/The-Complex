extends KinematicBody2D

var motion = Vector2()
var speed = 1
var bulletSpeed = 500

var bulletAttack = preload("res://hurtStuff/turretGunStuff.tscn")

var _timer = null

func _ready():
	set_physics_process(true)
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	_timer.stop()

func _on_Timer_timeout():
	fire()

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


func _on_PlayerDetectArea_body_entered(body):
	if "Player" in body.name:
		_timer.start()


func _on_PlayerDetectArea_body_exited(body):
	if "Player" in body.name:
		_timer.stop()
