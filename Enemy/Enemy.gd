extends "res://Boat/Boat.gd"

var direction = Vector2()
onready var player = get_node("../../Player")

func _ready():
	set_process(true)

func _process(delta):
	if direction != null:
		makeMove(direction)
		pass

	if is_colliding():
		direction = (get_global_pos()-get_collision_pos())/Vector2(100, 100)
	elif rand_range(1, 200) < 2:
		direction = Vector2(floor(rand_range(1, 3)-rand_range(1, 2)), floor(rand_range(1, 3)-rand_range(1, 2)))
		if rand_range(1, 60) < 2:
			direction = null

func _on_AngerArea_body_enter( body ):
	if body.get_parent() == player:
		print("Player detected!")
		direction = Vector2()
		shootTo(body.get_global_pos())
