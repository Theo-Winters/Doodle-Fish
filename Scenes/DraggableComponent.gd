extends Area2D
class_name DraggableComponent

var dragging = false

signal dragsignal;

func _ready():
	connect("dragsignal", _set_drag_pc)

#func _process(delta):
	#if dragging:
		#var mousepos = get_viewport().get_mouse_position()
		#self.get_parent().position = Vector2(mousepos.x, mousepos.y)

func _set_drag_pc():
	dragging=!dragging

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			$"../PlantUIController".visible=!$"../PlantUIController".visible
			dragging = true
		elif event.button_index == 1 and !event.pressed:
			dragging = false
	elif event is InputEventScreenTouch:
		if event.pressed and event.get_index() == 0:
			self.get_parent().position = event.get_position()
	
	if event is InputEventMouseMotion and dragging:
		get_parent().position += event.relative
