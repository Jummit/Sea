extends MarginContainer

func _on_StartButton_pressed():
	var game = load("res://Game.tscn")
	get_node("/root/Root/Game").add_child(game.instance())
	hide()
