extends CanvasLayer

onready var stats = get_node("Stats")
onready var inventory = get_node("Inventory")

var inventory_open = false

func open_inventory():
	inventory_open = true
	stats.hide()
	inventory.show()

func close_inventory():
	inventory_open = false
	stats.show()
	inventory.hide()