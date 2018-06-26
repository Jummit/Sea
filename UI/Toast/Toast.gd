extends Panel

onready var text = get_node("HBoxContainer/Text")
onready var icon = get_node("HBoxContainer/CenterContainer/Icon")
onready var animation = get_node("AnimationPlayer")
onready var timer = get_node("Timer")

func showToast(tostText, toastIcon):
	text.set_text(tostText)
	icon.set_texture(toastIcon)
	animation.set_current_animation("Show")
	animation.play()
	timer.start()

func _on_Timer_timeout():
	animation.set_current_animation("Hide")
	animation.play()

func _ready():
	showToast("Find villages to loot and try to survive!", load("res://UI/Inventory/Items/Compass.tex"))