extends KinematicBody2D

signal move_on_land

var mode = "boat"
var boat_speed = 10000
var land_speed = 5000
var speed = boat_speed
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

onready var stats = get_node("../UI/StatsPanel/Stats")
onready var sprite = get_node("Sprite")
onready var islands = get_node("../Islands")
onready var boat = get_node("../Boat")

func remove_stat(name):
	var value = 0.01
	var stat = get_stat(name)
	if stat-value<=0:
		set_stat(name, 0)
		return true
	else:
		set_stat(name, stat-value)

func set_stat(name, val):
	stats.get_node(name).set_value(val)

func get_stat(name):
	return stats.get_node(name).value

func _ready():
	print(get_collision_mask())
	print(get_layer_mask())
	set_process(true)

func _process(delta):
	var moved = false
	for i in range(0, moves.size()):
		if Input.is_action_pressed("movement_"+moves.keys()[i]):
			moved = true
			if mode == "boat":
				remove_stat("Water")
				remove_stat("Food")
				sprite.set_frame(animations[moves.keys()[i]])
				sprite.stop()
			elif mode == "land":
				remove_stat("Food")
				sprite.set_animation("Player")
				sprite.play()

			var toMove = moves[moves.keys()[i]]*speed*delta
			move_and_slide(toMove)
			var collider = get_collider()
			if collider == islands:
				emit_signal("move_on_land", toMove.normalized())
				set_pos(get_pos()+toMove.normalized()*70)
	
	if not moved and mode == "land":
		sprite.set_animation("PlayerIdle")
		sprite.set_frame(0)

func _on_Player_move_in_boat():
	speed = boat_speed
	mode = "boat"
	sprite.set_animation("Ship")
	set_pos(boat.get_pos())
	sprite.stop()
	print("moved in boat")
	set_layer_mask(1)
	set_collision_mask(1)

func _on_Player_move_on_land(move):
	speed = land_speed
	mode = "land"
	sprite.set_animation("Player")
	sprite.set_frame(0)
	sprite.play()
	print("moved on land")
	set_layer_mask(2)
	set_collision_mask(2)
