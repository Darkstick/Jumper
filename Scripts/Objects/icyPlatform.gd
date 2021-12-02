extends KinematicBody2D

export var is_static = false
var rng = RandomNumberGenerator.new()

func _ready():
	if is_static == false:
		rng.randomize()
		var random = rng.randf_range(0.5, 2)
		$Sprite.scale *= Vector2(random,1)
		$Collision.scale *= Vector2(random, 1)

func contact(object):
	object.friction = 0.1
	object.acceleration = 0.02
