extends Node

var mode = "boat"
onready var boat = get_node("Boat")
onready var people = get_node("People")
onready var islands = get_node("../Islands")
onready var villages = get_node("../Villages")
onready var sea = get_node("../Sea")
onready var stats = get_node("../UI/Panel/VBoxContainer/Stats")
var vehicle

var moves = {
	left = Vector2(-1, 0),
	right = Vector2(1, 0),
	up = Vector2(0, -1),
	down = Vector2(0, 1),
}

func _ready():
	vehicle = boat
	set_process(true)

func _process(delta):
	vehicle.get_node("Camera").make_current()
	
	var toMove = Vector2()
	for i in range(0, moves.size()):
		if Input.is_action_pressed("movement_"+moves.keys()[i]):
			toMove += moves[moves.keys()[i]]

	vehicle.makeMove(toMove)

	var collider = vehicle.get_collider()

	if collider == islands:
		people.set_global_pos(boat.get_global_pos()+toMove.normalized()*70)
		vehicle = people
		people.show()

func _on_people_body_enter( body ):
	if body == boat:
		vehicle = boat
		people.hide()
	elif body.get_parent() == villages:
		body.loot()

func restore_stats():
	if stats.gold.value >= 1:
		stats.gold.decrease(1)
		stats.food.reset()
		stats.water.reset()

func eat():
	if stats.sanity.value <= 0:
		die("Your crew went insane!")
	else:
		if stats.food.value <= 0 or stats.food.value <= 0:
			stats.sanity.decrease(1)
		else:
			stats.sanity.add(1)
			stats.food.decrease(1)
			stats.water.decrease(1)

func die(message):
	var newdeatscreen = load("res://DeathScreen/DeathScreen.tscn").instance()
	newdeatscreen.message = message
	get_node("/root/Root/CanvasLayer").add_child(newdeatscreen)