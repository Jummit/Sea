extends Label

export var value = 0

func _ready():
	set_value(value)

func update_text():
	self.set_text(self.get_name()+": "+str(ceil(value)))

func decrease(val):
	if value-val <= 0:
		value = 0
	else:
		value -= val
	update_text()

func add(val):
	value += value
	update_text()

func set_value(val):
	value = val
	update_text()
