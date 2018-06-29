extends TileMap

var enemy = load("res://Enemy/Enemy.tscn")
onready var enemys = get_node("../Enemys")
signal generated

func _ready():
	for x in range(-50, 50):
		for y in range(-50, 50):
			var xpos = x*2
			var ypos = y*2
			set_cell(xpos, ypos, 0)
			set_cell(xpos+1, ypos, 1)
			set_cell(xpos, ypos+1, 2)
			set_cell(xpos+1, ypos+1, 3)
			if rand_range(1, 600) < 2:
				var newEnemy = enemy.instance()
				newEnemy.set_global_pos(Vector2(xpos, ypos)*get_cell_size())
				enemys.add_child(newEnemy)
	emit_signal("generated", self)
