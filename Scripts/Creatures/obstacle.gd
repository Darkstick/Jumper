extends KinematicBody2D

export var speed = 3
var velocity = Vector2.ZERO
var direction = 0 #0 = left, 1 = right

func _ready():
	z_index = -99

func _physics_process(delta):
	var collision = move_and_collide(velocity)
	if direction == 0:
		velocity.x = -speed
	else:
		velocity.x = speed
	if $RayLeft.is_colliding() == false:
		direction = 0
	if $RayRight.is_colliding() == false:
		direction = 1
	if collision:
		if collision.collider.name == "player":
			$AudioStreamPlayer.play()
			collision.collider.damage()

func contact(object):
	object.damage()
