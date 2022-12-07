extends KinematicBody2D

var motion = Vector2()
var health = 100000

var isMoving = false

var speed = 2

func _ready():
	isMoving = false

func _physics_process(delta):
	if (GlobalSettings.wallCharge == false):
		isMoving = false
	if (GlobalSettings.wallCharge == true):
		isMoving = true
	
	if (isMoving == false):
		speed = 0
	if (isMoving == true):
		speed = 2.5
		position += Vector2(speed, 0)
