extends Label

export var value = 0
export var limit = -1

func _ready():
	set_value(value)

func update_text():
	self.set_text(self.get_name()+": "+str(value))

func decrease(val):
	if value-val <= 0:
		value = 0
	else:
		value -= val
	update_text()

func add(val):
	if limit == -1 or value+val<=limit:
		value += val
		update_text()

func set_value(val):
	if limit != -1 and val>limit:
		value = limit
	else:
		value = val
	update_text()

func reset():
	value = int(get_parent().get_parent().startStats[get_name()])
	update_text()