extends KinematicBody2D

var speed = 1000
var target

func _ready():
	set_process(true)

func _process(delta):
	#move(direction*speed*delta)

	if is_colliding():
		print("Colliding!")
		var collider = get_collider()
		if collider.has_method("hitWithCannonBall"):
			collider.hitWithCannonBall()
		get_parent().remove_child(self)
