extends KinematicBody2D


var movespeed = 200
var bullet_speed = 1000
var weapon_select = 1
var bullet = preload("res://Bullet.tscn")
var bullet2 = preload("res://Bullet2.tscn")

var health = 50

var bullet_instance
var bullet_instance2

var parent_rotation 

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("up"):
		motion.y -= 1
	if Input.is_action_pressed("down"):
		motion.y += 1
	if Input.is_action_pressed("left"):
		motion.x -= 1
	if Input.is_action_pressed("right"):
		motion.x += 1
	
	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed)
	#look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("weapon 1"):
		weapon_select = 1
	if Input.is_action_just_pressed("weapon 2"):
		weapon_select = 2

	if Input.is_action_just_pressed("LMB"):
		fire()
	
	$HealthBar/ProgressBar.value = health

func fire():
	if weapon_select == 1:
		bullet_speed = 500
		var bullet_instance = bullet.instance()
		bullet_instance.position = get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
		get_tree().get_root().call_deferred("add_child", bullet_instance)
		yield(get_tree().create_timer(2.0), "timeout")
		get_tree().get_root().call_deferred("remove_child", bullet_instance)
	if weapon_select == 2:
		bullet_speed = 1000
		var bullet_instance2 = bullet2.instance()
		bullet_instance2.position = get_global_position()
		bullet_instance2.rotation_degrees = rotation_degrees
		bullet_instance2.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
		get_tree().get_root().call_deferred("add_child", bullet_instance2)
		yield(get_tree().create_timer(2.0), "timeout")
		get_tree().get_root().call_deferred("remove_child", bullet_instance2)


func kill():
	get_tree().reload_current_scene()

func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		if health <= 0:
			kill()
		else:
			modulate.a = 0.5
			yield(get_tree().create_timer(0.3), "timeout")
			modulate.a = 1
			yield(get_tree().create_timer(0.3), "timeout")
			modulate.a = 0.5
			yield(get_tree().create_timer(0.3), "timeout")
			modulate.a = 1
			yield(get_tree().create_timer(0.3), "timeout")
			modulate.a = 0.5
			yield(get_tree().create_timer(0.3), "timeout")
			modulate.a = 1
			health = health - 10
			

