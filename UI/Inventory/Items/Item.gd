extends TextureFrame

var acquired = false;
onready var title = get_node("Title")
onready var action = get_node("Action")

func _ready():
	set_process(true)
	title.set_text(get_name())
	set_texture(load("res://UI/Inventory/Items/"+get_name()+".tex"))
	set_material(load("res://UI/Inventory/Items/NotAcquiredMaterial.tres"))

func acquire():
	acquired = true
	set_material()

func _input_event( ev ):
	if ev.type == InputEvent.MOUSE_BUTTON:
		get_node("../../../../../../").set_info(get_name(), get_node("Description").get_text(), get_texture())

func _process(delta):
	action.process(acquired)