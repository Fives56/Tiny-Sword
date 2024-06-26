extends Node2D

var dragging = false
var selected = []
var drag_start = Vector2.ZERO
var select_rectangle = RectangleShape2D.new()

@onready var camera = $Camera
@onready var select_draw = $SelectDraw

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT :
		if event.pressed:
			select(false)
			selected = []
			dragging = true
			drag_start = camera.get_global_mouse_position()
		elif dragging: 
			dragging = false
			var drag_end = camera.get_global_mouse_position()
			select_draw.update_status(drag_start, drag_end, dragging)
			select_rectangle.extents = (drag_end - drag_start) / 2 
			var space = get_world_2d().direct_space_state
			var query = PhysicsShapeQueryParameters2D.new()
			query.set_shape(select_rectangle)
			query.transform = Transform2D(0, (drag_end + drag_start) /2 )
			selected = space.intersect_shape(query)
			select(true)
	if dragging:
		if event is InputEventMouseMotion:
			select_draw.update_status(drag_start, camera.get_global_mouse_position(), dragging)


##Se actualiza el estado de las unidades seleccionadas
func select(state: bool):
	for unit in selected:
				if unit.collider.is_in_group("troops"):
					unit.collider.state["selected"] = state
