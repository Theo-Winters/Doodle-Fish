extends CharacterBody2D
class_name FishEntity


func _on_input_event(viewport, event, shape_idx):
	if  event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if $UIController.visible:
			$UIController.visible = false
		else:
			$UIController.visible = true

func get_sprite():
	return $Sprite2D.texture
	
func get_buy_value():
	return $ValueController.BaseValue
