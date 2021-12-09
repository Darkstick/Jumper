extends KinematicBody2D

export var speed = 3
var velocity = Vector2.ZERO
var direction = 0 #0 = left, 1 = right

func _ready():
	$RayLeft.add_exception($player)
	$RayRight.add_exception($player)
	z_index = -2

func _physics_process(delta):
	var collision = move_and_collide(velocity)
	if direction == 0:
		velocity.x = -speed
	else:
		velocity.x = speed
	if $RayLeft.is_colliding() == true:
		direction = 1
	if $RayRight.is_colliding() == true:
		direction = 0

func contact(object):
	object.friction = 0.2
	object.acceleration = 0.25

