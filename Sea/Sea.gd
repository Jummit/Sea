extends TileMap

var enemy = load("res://Enemy/Enemy.tscn")
onready var enemys = get_node("../Enemys")
signal generated

func _ready():
	for x in range(-100, 100):
		for y in range(-100, 100):
			set_cell(x, y, 0)
			if rand_range(1, 600) < 2:
				var newEnemy = enemy.instance()
				newEnemy.set_global_pos(Vector2(x, y)*get_cell_size())
				enemys.add_child(newEnemy)
	emit_signal("generated", self)