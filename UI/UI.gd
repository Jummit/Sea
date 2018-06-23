extends CanvasLayer

onready var stats = get_node("Stats")
onready var inventory = get_node("Inventory")
onready var inventoryAnimation = inventory.get_node("AnimationPlayer")
var inventory_open = false

func open_inventory():
	inventoryAnimation.set_current_animation("OpenAnimation")
	inventoryAnimation.play()
	inventory_open = true

func close_inventory():
	inventoryAnimation.set_current_animation("CloseAnimation")
	inventoryAnimation.play()
	inventory_open = false
