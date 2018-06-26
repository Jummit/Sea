extends Panel

var acquired = false;
onready var title = get_node("VBoxContainer/Title")
onready var action = get_node("Action")
onready var texture = get_node("VBoxContainer/CenterContainer/Texture")
var image

func _ready():
	set_process(true)
	title.set_text(get_name())

	var image = load("res://UI/Inventory/Items/"+get_name()+".tex")
	if image != null:
		texture.set_texture(image)
	texture.set_material(load("res://UI/Inventory/Items/NotAcquiredMaterial.tres"))

func acquire():
	acquired = true
	texture.set_material(CanvasItemMaterial.new())

func _input_event( ev ):
	if ev.type == InputEvent.MOUSE_BUTTON:
		get_node("../../../../../../").set_info(get_name(), get_node("Description").get_text(), texture.get_texture())

func _process(delta):
	if action.has_method("process"):
		action.process(acquired)