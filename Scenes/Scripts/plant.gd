extends Area2D

var dragging = false

func get_sprite():
	return $Sprite2D.texture

func save():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"posx" : self.position.x,
		"posy" : self.position.y
	}
	return save_dict

func _process(delta):
	if dragging:
		var mousepos = get_viewport().get_mouse_position()
		self.position = Vector2(mousepos.x, mousepos.y)


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			if dragging:
				dragging = false
			$PlantUIComponent.visible=!$PlantUIComponent.visible
	elif event is InputEventScreenTouch:
		if event.pressed and event.get_index() == 0:
			$PlantUIComponent.visible=!$PlantUIComponent.visible
	
	if event is InputEventMouseMotion and dragging:
		self.position += event.relative


func _on_move_button_pressed():
	dragging = true
	$PlantUIComponent.visible = false
