extends KinematicBody2D

signal move_on_land

var speed = 10000
var moves = {
	left = Vector2(-1, 0),
	right = Vector2(1, 0),
	up = Vector2(0, -1),
	down = Vector2(0, 1),
}

var animations = {
	left = 0,
	right = 1,
	up = 2,
	down = 3,
}

onready var sprite = get_node("Sprite")
onready var islands = get_node("../Islands")
onready var boat = get_node("../Boat")

func _ready():
	print(get_collision_mask())
	print(get_layer_mask())
	set_process(true)

func _process(delta):
	for i in range(0, moves.size()):
		if Input.is_action_pressed("movement_"+moves.keys()[i]):
			sprite.set_frame(animations[moves.keys()[i]])
			var toMove = moves[moves.keys()[i]]*speed*delta
			move_and_slide(toMove)
			var collider = get_collider()
			if collider == islands:
				print("test")
				emit_signal("move_on_land", toMove.normalized())
				set_pos(get_pos()+toMove.normalized()*70)

func _on_Player_move_in_boat():
	sprite.set_animation("Ship")
	set_pos(boat.get_pos())
	print("moved in boat")
	set_layer_mask(1)
	set_collision_mask(1)

func _on_Player_move_on_land(move):
	sprite.set_animation("Player")
	sprite.set_frame(0)
	print("moved on land")
	set_layer_mask(2)
	set_collision_mask(2)
