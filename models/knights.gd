extends CharacterBody2D
class_name Knigth

@export var speed = 300
const toop_type = ["Warrior", "Archer", "Pawn"]
var state = {"selected": false, "moved": false, "attack": false, "build": false}

var target = position
var rng = RandomNumberGenerator.new()

func look_direction(sprite: AnimatedSprite2D) -> void:
	var direction_to_target: Vector2 = (target - global_position).normalized()
	# Calcula el producto punto con Vector2.RIGHT
	var dot_product: float = direction_to_target.dot(Vector2.RIGHT)
	# Verifica la dirección
	if dot_product > 0:
		sprite.flip_h = false
	else: 
		sprite.flip_h = true
		
func move(sprite: AnimatedSprite2D, animations) -> void:
	if position.distance_to(target) > 10 and state["moved"]:
		move_and_slide()
		sprite.play(animations["move"])
		look_direction(sprite)
	elif (not state["attack"]):
		sprite.play(animations["idle"])
		state["move"] = false
		
func selected(selected_circle: Polygon2D):
	selected_circle.visible = state["selected"] if  true else  false
	

