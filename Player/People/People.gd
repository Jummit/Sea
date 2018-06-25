extends KinematicBody2D

onready var villages = get_node("../../Villages")
onready var sprite = get_node("Sprite")
var speed = 100

func _ready():
	set_process(true)

func makeMove(move):
	if move == Vector2():
		sprite.set_animation("Idle")
		sprite.stop()
		sprite.set_frame(0)
	else:
		sprite.set_animation("Walking")
		sprite.play()
		move_and_slide(move*speed)