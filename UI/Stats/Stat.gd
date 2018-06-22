extends Label

export var value = 0

func _ready():
	set_value(value)

func set_value(val):
	value = val
	self.set_text(self.get_name()+": "+str(ceil(value)))
