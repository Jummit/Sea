extends Node

func process(acquired):
	if acquired:
		var playerboat = get_node("/root/Root/Game/Game/Player/Boat")
		if playerboat != null:
			playerboat.speed = 300