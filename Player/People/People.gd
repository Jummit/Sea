extends KinematicBody2D

var speed = 100

func makeMove(move):
	move_and_slide(move*speed)