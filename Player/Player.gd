extends KinematicBody2D

var moves = {
	left = Vector2(-1, 0),
	right = Vector2(1, 0),
	up = Vector2(0, -1),
	down = Vector2(0, 1),
}

var speed = 10000

func _ready():
	set_process(true)

func _process(delta):
	for i in range(0, moves.size()):
		if Input.is_action_pressed("movement_"+moves.keys()[i]):
			var toMove = moves[moves.keys()[i]]*speed*delta
			move_and_slide(toMove)
