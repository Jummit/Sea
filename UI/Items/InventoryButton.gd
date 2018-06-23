extends TextureButton

onready var ui = get_node("../../UI")

func _ready():
	set_process(true)

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		ui.close_inventory()

func _pressed():
	if ui.inventory_open:
		ui.close_inventory()
	else:
		ui.open_inventory()