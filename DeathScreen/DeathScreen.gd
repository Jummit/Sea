extends CanvasLayer

onready var deathmessage = get_node("MarginContainer/Panel/VBoxContainer/DeathMessage")
onready var itemmessage = get_node("MarginContainer/Panel/VBoxContainer/ItemMessage")
onready var itemlist = get_node("MarginContainer/Panel/VBoxContainer/Items")
onready var inventoryitems = get_node("/root/Root/CanvasLayer/Inventory/Panel/VBoxContainer/HBoxContainer/Items/GridContainer")
onready var menu = get_node("/root/Root/CanvasLayer/Menu")
onready var game = get_node("/root/Root/Game")
var message = "You died"

func _ready():
	deathmessage.set_text(message)
	for item in inventoryitems.get_children():
		if item.acquired:
			itemlist.add_child(item.duplicate())
	if itemlist.get_child_count() <= 0:
		itemmessage.set_text("You collected no items this run!")

func _on_ReturnButton_pressed():
	game.remove_child(game.get_child(0))
	menu.show()
	get_parent().remove_child(self)
