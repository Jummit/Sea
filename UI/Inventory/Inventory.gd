extends MarginContainer

onready var description = get_node("Panel/VBoxContainer/HBoxContainer/Info/VBoxContainer/MarginContainer/Description")
onready var title = get_node("Panel/VBoxContainer/HBoxContainer/Info/VBoxContainer/Name")
onready var image = get_node("Panel/VBoxContainer/HBoxContainer/Info/VBoxContainer/CenterContainer/Texture")
onready var items = get_node("Panel/VBoxContainer/HBoxContainer/Items/GridContainer")
onready var animation = get_node("AnimationPlayer")
onready var ui = get_parent()
var is_open = false

func open():
	if not is_open and animation.get_current_animation_length() == animation.get_current_animation_pos():
		animation.set_current_animation("OpenAnimation")
		animation.play()
		is_open = true

func close():
	if is_open and animation.get_current_animation_length() == animation.get_current_animation_pos():
		animation.set_current_animation("CloseAnimation")
		animation.play()
		is_open = false

func toggle():
	if is_open:
		close()
	else:
		open()

func set_info(itemTitle, itemDescription, itemImage):
	description.set_text(itemDescription)
	title.set_text(itemTitle)
	image.set_texture(itemImage)

func _ready():
	set_process(true)

func _process(delta):
	if Input.is_action_pressed("inventory_toggle"):
		toggle()
