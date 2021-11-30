extends KinematicBody2D

func contact(object):
	object.friction = 0.1
	object.acceleration = 0.02
