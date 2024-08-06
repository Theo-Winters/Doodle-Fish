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

func set_hunger(value, time):
	$HungerController.set_hunger(value, time)

func set_growth(value, time):
	$GrowthController.set_growth(value, time)
	


func save():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"hunger" : $HungerController.hunger,
		"growth" : $GrowthController.growth
	}
	return save_dict
	
