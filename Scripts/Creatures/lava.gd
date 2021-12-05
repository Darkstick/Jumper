extends KinematicBody2D

export var speed = 1
var velocity = Vector2.ZERO

func _ready():
	z_index = 1

func _physics_process(delta):
	var collision = move_and_collide(velocity)
	velocity.y = -speed

func contact(body):
	print("ow.")
