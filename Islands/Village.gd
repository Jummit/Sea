extends StaticBody2D

var looted = false
var lootedTexture = load("res://Islands/LootedVillage.tex")
onready var sprite = get_node("Sprite")
onready var particles = get_node("Particles")
onready var toast = get_node("../../UI/Toast")
onready var player = get_node("../../Player")
onready var stats = get_node("../../UI/Panel/VBoxContainer/Stats")

func loot():
	randomize()
	var inventory = get_node("/root/Root/CanvasLayer/Inventory")
	if not looted:
		lootedTexture.set_size_override(Vector2(64, 64))
		sprite.set_texture(lootedTexture)
		particles.set_emitting(true)
		
		var rand = rand_range(1, 10)
		if rand < 8:
			var rand = ceil(rand_range(1, 4)-1)
			if rand == 1:
				if stats.gold.value >= 1:
					stats.gold.decrease(1)
					stats.food.add(30)
					stats.water.add(30)
					toast.showToast("You traded gold for food and water!", lootedTexture)
				else:
					toast.showToast("You found some gold on the street!", lootedTexture)
					stats.gold.add(1)
			elif rand == 2:
				if not inventory.is_every_item_acquired():
					var item
					var items = inventory.get_items()
					while item == null:
						var randitem = items[rand_range(0, items.size())]
						if not inventory.items.get_node(randitem).acquired:
							item = randitem
					inventory.acquire_item(item)
					var text
					var textrand = round(rand_range(1, 5))
					if textrand == 1:
						text = "You found a "+item+"!"
					elif textrand == 2:
						text = "An old stranger gave you a "+item+"!"
					elif textrand == 3:
						text = "Someone threw a "+item+" at you!"
					elif textrand == 4:
						text = "You made yourself a "+item
					elif textrand == 5:
						text = "You made a "+item+"s out of thin air!"
					toast.showToast(text, inventory.items.get_node(item).texture.get_texture())
					inventory.open()
			elif rand == 3:
				toast.showToast("Someone joined the crew!", lootedTexture)
				stats.crew.add(1)
		else:
			toast.showToast("A crewmen was attacked and killed by pidgeons! 0.0", lootedTexture)
			stats.sanity.decrease(10)
			stats.crew.decrease(1)

		looted = true