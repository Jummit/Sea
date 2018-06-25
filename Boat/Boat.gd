extends KinematicBody2D

onready var sprite = get_node("Sprite")
export var speed = 250
var animations = {
	left = 0,
	right = 1,
	up = 2,
	down = 3,
	leftdown = 4,
	rightdown = 5,
	leftup = 6,
	rightup = 7
}

func moveBoat(move):
	move_and_slide(move*speed)
	
	var animation
	if move == Vector2(0, 1):
		animation = "down"
	elif move == Vector2(0, -1):
		animation = "up"
	elif move == Vector2(1, 0):
		animation = "right"
	elif move == Vector2(-1, 0):
		animation = "left"
	elif move == Vector2(-1, -1):
		animation = "leftup"
	elif move == Vector2(1, 1):
		animation = "rightdown"
	elif move == Vector2(-1, 1):
		animation = "leftdown"
	elif move == Vector2(1, -1):
		animation = "rightup"

	if animation != null:
		sprite.set_frame(animations[animation])
	sprite.stop()