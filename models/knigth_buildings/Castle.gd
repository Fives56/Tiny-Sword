extends StaticBody2D

var escena_unidad = preload("res://models/warrior.tscn")

func _ready():
	add_to_group("castle")

func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("BUTTON_RIGTH"):
		print("Helooo")
