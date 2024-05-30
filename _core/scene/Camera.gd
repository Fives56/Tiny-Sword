extends Camera2D

# Configura la velocidad de la cámara y la zona de detección del borde
@export var  speed = 400
var edge_threshold = 50

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var cam_pos = global_position
	var viewport_size = get_viewport_rect().size

	# Comprueba si el mouse está en el borde izquierdo de la cámara
	if mouse_pos.x < cam_pos.x - viewport_size.x / 2 + edge_threshold:
		cam_pos.x -= speed * delta
	# Comprueba si el mouse está en el borde derecho de la cámara
	elif mouse_pos.x > cam_pos.x + viewport_size.x / 2 - edge_threshold:
		cam_pos.x += speed * delta
	# Comprueba si el mouse está en el borde superior de la cámara
	if mouse_pos.y < cam_pos.y - viewport_size.y / 2 + edge_threshold:
		cam_pos.y -= speed * delta
	# Comprueba si el mouse está en el borde inferior de la cámara
	elif mouse_pos.y > cam_pos.y + viewport_size.y / 2 - edge_threshold:
		cam_pos.y += speed * delta

	# Actualiza la posición de la cámara
	global_position = cam_pos
