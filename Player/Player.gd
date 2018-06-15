extends KinematicBody2D

signal move_on_land

var moves = {
	left = Vector2(-1, 0),
	right = Vector2(1, 0),
	up = Vector2(0, -1),
	down = Vector2(0, 1),
}

onready var islands = get_node("../Islands")
onready var boat = get_node("../Boat")
var speed = 10000

func move_on_water():
	set_layer_mask(1)
	set_collision_mask(1)

func _ready():
	set_process(true)

func _process(delta):
	for i in range(0, moves.size()):
		if Input.is_action_pressed("movement_"+moves.keys()[i]):
			var toMove = moves[moves.keys()[i]]*speed*delta
			move_and_slide(toMove)
			var collider = get_collider()
			if collider == islands:
				move(toMove)
				emit_signal("move_on_land")

func _on_Player_move_in_boat():
	pass

func _on_Player_move_on_land():
	set_layer_mask(2)
	set_collision_mask(2)
