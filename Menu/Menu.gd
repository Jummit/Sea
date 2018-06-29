extends MarginContainer

onready var game = get_node("../../Game")

func _on_StartButton_pressed():
	game.start_game()
