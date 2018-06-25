extends KinematicBody2D

onready var villages = get_node("../../Villages")
var speed = 100

func makeMove(move):
	move_and_slide(move*speed)