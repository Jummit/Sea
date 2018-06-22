extends TileMap

func try_to_generate_island_tile(x, y, sandy):
	if get_cell(x, y) < 1:
		if rand_range(1, 20)<9:
			generate_island_tile(x, y, sandy)

func generate_island_tile(x, y, sandy):
	if sandy:
		set_cell(x, y, 3)
	else:
		set_cell(x, y, rand_range(0, 3))
	get_node("../Sea").set_cell(x, y, -1)

	try_to_generate_island_tile(x+1, y, sandy)
	try_to_generate_island_tile(x-1, y, sandy)
	try_to_generate_island_tile(x, y+1, sandy)
	try_to_generate_island_tile(x, y-1, sandy)

func generate_island(x, y):
	generate_island_tile(x, y, floor(rand_range(1, 5)) == 1)

func _on_Sea_generated(sea):
	randomize()
	var islands = []
	for i in range(1, 50):
		islands.append(Vector2(rand_range(-100, 100), rand_range(-100, 100)))
	for island in islands:
		generate_island(island.x, island.y)
