extends CharacterBody2D


func _on_input_event(viewport, event, shape_idx):
	if  event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if $UIController.visible:
			$UIController.visible = false
		else:
			$UIController.visible = true
