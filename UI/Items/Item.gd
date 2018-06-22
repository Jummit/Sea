extends Sprite

var acquired = false;
var blackandwhitematerial = load("res://Items/blackandwhite.tres")

func acquire():
	acquired = true
	set_material(blackandwhitematerial)