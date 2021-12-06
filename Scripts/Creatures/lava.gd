extends KinematicBody2D

export var speed = 1
var velocity = Vector2.ZERO

func _ready():
	z_index = 1

func contact(body):
	body.damage()

func _physics_process(delta):
	var collision = move_and_collide(velocity)
	velocity.y = -speed
	if collision:
		if collision.collider.name == "player":
			collision.collider.damage()
