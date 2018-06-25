extends "res://Boat/Boat.gd"

var moves = {
	left = Vector2(-1, 0),
	right = Vector2(1, 0),
	up = Vector2(0, -1),
	down = Vector2(0, 1),
}

func _ready():
	set_process(true)

func _process(delta):
	# check every input and add the correct vector to the wanted move if its pressed
	var toMove = Vector2()
	for i in range(0, moves.size()):
		if Input.is_action_pressed("movement_"+moves.keys()[i]):
			toMove += moves[moves.keys()[i]]

	moveBoat(toMove)