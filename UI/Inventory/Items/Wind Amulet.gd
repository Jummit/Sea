extends "res://UI/Inventory/Items/Item.gd"

onready var boat = get_node("/root/Root/Game/Player/Boat")

func process(acquired):
	if acquired:
		boat.speed = 100