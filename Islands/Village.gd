extends StaticBody2D

var looted = false
var lootedTexture = load("res://Islands/LootedVillage.tex")
onready var sprite = get_node("Sprite")
onready var particles = get_node("Particles")
onready var toast = get_node("../../UI/Toast")

func loot():
	if not looted:
		lootedTexture.set_size_override(Vector2(64, 64))
		sprite.set_texture(lootedTexture)
		particles.set_emitting(true)
		toast.showToast("You looted a village!", lootedTexture)
		looted = true