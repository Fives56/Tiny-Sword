extends Knigth
var sprite: AnimatedSprite2D 
var ANIMATIONS
var color = "blue"

func _ready() -> void:
	color = self.color
	sprite = $knigth_sprite
	add_to_group("troops")
	ANIMATIONS = preload("res://_utils/Knigths/warriors_animations.gd").new().ANIMATIONS
	

func _physics_process(delta: float) -> void:
	velocity = position.direction_to(target) * speed
	move(sprite, ANIMATIONS[color])
		
func _input(event)  -> void:
	if event.is_action_pressed("BUTTON_RIGTH"):
		target = get_global_mouse_position()
		state["move"] = true
	if event.is_action_pressed("ui_accept"):
		state["attack"] = true
		attack()
		
	
func attack() -> void:
	if(state["attack"]):
		var attack_type = randi() % 3
		print(attack_type)
		sprite.play(ANIMATIONS["blue"]["attack"][attack_type])

func _on_knigth_sprite_animation_finished():
	print(sprite.animation)
	if sprite.animation in ANIMATIONS["blue"]["attack"]:
			state["attack"] = false
