extends Node

onready var menu = get_node("../CanvasLayer/Menu")

func start_game():
	var game = load("res://Game.tscn")
	get_node("/root/Root/Game").add_child(game.instance())
	menu.hide()