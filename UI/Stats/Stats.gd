extends Panel

onready var gold = get_node("VBoxContainer/Gold")
onready var water = get_node("VBoxContainer/Water")
onready var food = get_node("VBoxContainer/Food")
onready var sanity = get_node("VBoxContainer/Sanity")
onready var crew = get_node("VBoxContainer/Crew")
var startStats

func _ready():
	startStats = {
		Water = water.get_text(),
		Food = food.get_text(),
		Sanity = sanity.get_text(),
		Crew = crew.get_text(),
		Gold = gold.get_text(),
	}
