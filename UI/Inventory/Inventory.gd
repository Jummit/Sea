extends MarginContainer

onready var description = get_node("Panel/VBoxContainer/HBoxContainer/Info/VBoxContainer/MarginContainer/Description")
onready var title = get_node("Panel/VBoxContainer/HBoxContainer/Info/VBoxContainer/Name")
onready var image = get_node("Panel/VBoxContainer/HBoxContainer/Info/VBoxContainer/CenterContainer/Texture")
onready var items = get_node("Panel/VBoxContainer/HBoxContainer/Items/GridContainer")

func set_info(itemTitle, itemDescription, itemImage):
	description.set_text(itemDescription)
	title.set_text(itemTitle)
	image.set_texture(itemImage)