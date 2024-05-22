extends Polygon2D

# Número de segmentos para dibujar el círculo.
@export var segments = 64

# Radio del círculo.
@export var radius = 50.0

func _ready():
	update_circle()

func update_circle():
	var points = []
	for i in range(segments):
		var angle = i * 2.0 * PI / segments
		var point = Vector2(cos(angle), sin(angle)) * radius
		points.append(point)
	polygon = points
