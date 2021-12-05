extends KinematicBody2D

export var is_static = false
var rng = RandomNumberGenerator.new()
var exit = preload("res://Scenes/Objects/exitDoor.tscn")
var obs = preload("res://Scenes/Creatures/obstacle.tscn")

func _ready():
	if is_static == false:
		rng.randomize()
		var random = rng.randf_range(0.5, 2)
		$Sprite.scale *= Vector2(random,1)
		$Collision.scale *= Vector2(random, 1)

func spawn_exit():
	var door = exit.instance()
	door.position.y -= 65
	add_child(door)

func spawn_obstacle():
	var obstacle = obs.instance()
	obstacle.position.y -= 20
	add_child(obstacle)

func contact(object):
	object.friction = 0.2
	object.acceleration = 0.25
