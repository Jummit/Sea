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

func makeMove(toMove):
	move_and_slide(toMove*speed)
	
	var animation
	if toMove == Vector2(0, 1):
		animation = "down"
	elif toMove == Vector2(0, -1):
		animation = "up"
	elif toMove == Vector2(1, 0):
		animation = "right"
	elif toMove == Vector2(-1, 0):
		animation = "left"
	elif toMove == Vector2(-1, -1):
		animation = "leftup"
	elif toMove == Vector2(1, 1):
		animation = "rightdown"
	elif toMove == Vector2(-1, 1):
		animation = "leftdown"
	elif toMove == Vector2(1, -1):
		animation = "rightup"

	if animation != null:
		sprite.set_frame(animations[animation])
	sprite.stop()