extends CanvasLayer

onready var player = get_node("../Player")
onready var particles = get_node("Particles")
onready var timer = get_node("Timer")
onready var animationplayer = get_node("AnimationPlayer")
var raining = true

func _ready():
	timer.start()
	set_process(true)

func _process(delta):
	var screensize = get_viewport().get_rect().size
	particles.set_emission_half_extents(screensize)

func toggle_rain():
	print("Rain toggling!")
	raining = not raining
	particles.set_emitting(raining)
	timer.set_wait_time(rand_range(2, 7)*60)
	timer.start()
