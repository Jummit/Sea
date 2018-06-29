extends Panel

var acquired = false;
onready var title = get_node("CenterContainer/VBoxContainer/Title")
onready var action = get_node("Action")
onready var texture = get_node("CenterContainer/VBoxContainer/CenterContainer/Texture")
var image

func _ready():
	set_process(true)
	title.set_text(get_name())

	var image = load("res://Inventory/Items/"+get_name()+".tex")
	if image != null:
		texture.set_texture(image)
	texture.set_material(load("res://Inventory/Items/NotAcquiredMaterial.tres"))

func acquire():
	acquired = true
	texture.set_material(CanvasItemMaterial.new())

func _input_event( ev ):
	print("test")
	if ev.type == InputEvent.MOUSE_BUTTON:
		get_node("../../../../../../").set_info(get_name(), get_node("Description").get_text(), texture.get_texture())

func _process(delta):
	if action.has_method("process"):
		action.process(acquired)

func _on_Area2D_input_event( viewport, event, shape_idx ):
	print(event.type)


func _on_Button_pressed():
	get_node("../../../../../../").set_info(get_name(), get_node("Description").get_text(), texture.get_texture())
