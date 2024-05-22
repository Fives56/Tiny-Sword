extends StaticBody2D

var escena_unidad = preload("res://models/warrior.tscn")

func _ready():
	add_to_group("castle")
