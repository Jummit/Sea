extends Node

var did_set_water = false

func process(acquired):
	if acquired and not did_set_water:
		var stats = get_node("/root/Root/Game/Game/UI/Panel/VBoxContainer/Stats")
		if stats != null:
			stats.water.set_value(50)
			did_set_water = true