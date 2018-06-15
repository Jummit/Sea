extends TileMap

func _ready():
	for i in range(1, 100):
		var pos = Vector2(rand_range(-100, 100), rand_range(-100, 100))
		for x in range(-3, 3):
			for y in range(-3, 3):
				set_cell(pos.x+x, pos.y+y, 0)
