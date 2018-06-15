extends TileMap

func _ready():
	for x in range(-100, 100):
		for y in range(-100, 100):
			set_cell(x, y, 0)