extends KinematicBody2D

var cannonball = load("res://Boat/CannonBall/CannonBall.tscn")
onready var cannonballs = get_node("/root/Root/Game/Game/CannonBalls")
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

func shootTo(point):
	var cannonballtoshoot = cannonball.instance()
	cannonballtoshoot.set_global_pos(get_global_pos()+Vector2(-20, 0))
	cannonballtoshoot.target = point
	cannonballs.add_child(cannonballtoshoot)

func hitWithCannonBall():
	print("ouch")

func makeMove(toMove):
	toMove.x = ceil(toMove.x)
	toMove.y = ceil(toMove.y)
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