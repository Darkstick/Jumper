extends KinematicBody2D

export var maxspeed = 300
export var jumpspeed = -1000
export var gravity = 2000
export (float, 0, 1.0) var friction = 0.2
export (float, 0, 1.0) var acceleration = 0.25
var velocity = Vector2.ZERO
var platform = null

func get_input():
	var dir = 0
	if Input.is_action_pressed("right"):
		dir += 1
	if Input.is_action_pressed("left"):
		dir -= 1
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * maxspeed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)
	if Input.is_action_pressed("down"):
		pass
	if Input.is_action_pressed("reset"):
		get_tree().change_scene("res://Scenes/Levels/main.tscn")

func _physics_process(delta):
	#movement#
	if is_on_floor():
		get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("up"):
		if is_on_floor():
			velocity.y = jumpspeed

	#floor detection#
	if $Ground.is_colliding():
		platform = $Ground.get_collider()
		platform.contact(self)
