extends KinematicBody2D

export var speed = 1
var velocity = Vector2.ZERO

func _ready():
	z_index = 1

func set_speed(change):
	speed = change

func contact(body):
	body.damage()


func _physics_process(delta):
	var collision = move_and_collide(velocity)
	if(Global.started == true):
		velocity.y = -speed
	if collision:
		if collision.collider.name == "player":
			$AudioStreamPlayer.play()
			collision.collider.damage()
