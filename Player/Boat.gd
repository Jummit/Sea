extends Sprite

signal move_in_boat
onready var player = get_node("../Player")

func _on_player_enter_boat( body ):
	if body == player:
		print("test")
		emit_signal("move_in_boat")
		hide()

func _on_Player_move_on_land():
	set_pos(player.get_pos())
	show()
