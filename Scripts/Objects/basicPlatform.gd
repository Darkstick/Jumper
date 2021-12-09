extends KinematicBody2D

export var is_static = false
export var z_level = 0

var rng = RandomNumberGenerator.new()
var exit = preload("res://Scenes/Objects/exitDoor.tscn")
var obs = preload("res://Scenes/Creatures/obstacle.tscn")

func _ready():
	z_index = z_level
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
	var random = rng.randf_range(0.7, 2)
	#reseting the size of the platform
	$Sprite.scale = Vector2(2.5,0.5)
	$Collision.scale = Vector2(1.034, 1.033)
	#to resize them to their new parameters.
	$Sprite.scale *= Vector2(random, 1)
	$Collision.scale *= Vector2(random, 1)
	obstacle.position.y -= 20
	add_child(obstacle)

func contact(object):
	object.friction = 0.2
	object.acceleration = 0.25
