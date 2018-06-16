extends AnimatedSprite

signal move_in_boat
onready var player = get_node("../Player")
onready var boatentertimer = get_node("BoatEnterTimer")

func _on_player_enter_boat( body ):
	if body == player and boatentertimer.get_time_left() == 0:
		boatentertimer.start()
		emit_signal("move_in_boat")
		hide()

func _on_Player_move_on_land(direction):
	set_pos(player.get_pos()+direction)
	
	show()
