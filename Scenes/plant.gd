extends Node2D

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
