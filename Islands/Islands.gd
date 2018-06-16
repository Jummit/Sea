extends TileMap

func try_to_generate_island_tile(x, y, rand):
	if not get_cell(x, y) == 0:
		if rand_range(1, 20)<8:
			generate_island_tile(x, y, rand)

func generate_island_tile(x, y, rand):
	get_node("../Sea").set_cell(x, y, -1)
	set_cell(x, y, rand_range(0, 3))
	try_to_generate_island_tile(x+1, y, rand)
	try_to_generate_island_tile(x-1, y, rand)
	try_to_generate_island_tile(x, y+1, rand)
	try_to_generate_island_tile(x, y-1, rand)

func generate_island(x, y):
	generate_island_tile(x, y, 2)

func _on_Sea_generated(sea):
	randomize()
	for i in range(1, 50):
		generate_island(rand_range(-100, 100), rand_range(-100, 100))
