extends KinematicBody2D

func contact(object):
	object.friction = 0.2
	object.acceleration = 0.25

