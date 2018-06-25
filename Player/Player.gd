extends Node

var mode = "boat"
onready var boat = get_node("Boat")
onready var people = get_node("People")
onready var islands = get_node("../Islands")
onready var sea = get_node("../Sea")
var toControll

var moves = {
	left = Vector2(-1, 0),
	right = Vector2(1, 0),
	up = Vector2(0, -1),
	down = Vector2(0, 1),
}

func _ready():
	toControll = boat
	set_process(true)

func _process(delta):
	var toMove = Vector2()
	for i in range(0, moves.size()):
		if Input.is_action_pressed("movement_"+moves.keys()[i]):
			toMove += moves[moves.keys()[i]]

	toControll.makeMove(toMove)

	var collider = toControll.get_collider()

	if collider == islands:
		people.set_global_pos(boat.get_global_pos()+toMove.normalized()*70)
		toControll = people
		people.show()

func _on_people_move_to_boat( body ):
	toControll = boat
	people.hide()
