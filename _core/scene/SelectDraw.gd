extends Node2D

var dragging = false

var drag_start = Vector2.ZERO
var drag_end = Vector2.ZERO

func _draw():
	if dragging:
		draw_rect(Rect2(drag_start, drag_end - drag_start), Color(1, 1, 1, 1), false)
	
func update_status(start, end, drag):
	drag_start = start
	drag_end = end
	dragging = drag
	queue_redraw()
