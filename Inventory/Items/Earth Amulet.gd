extends Node

func process(acquired):
	if acquired:
		var playerpeople = get_node("/root/Root/Game/Game/Player/People")
		if playerpeople != null:
			playerpeople.speed = 300