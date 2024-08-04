extends Node2D
class_name HungerController

var hunger: float

func _ready():
	hunger  = 75

func Starve():
	if hunger <= 0:
		self.get_parent().queue_free()


func _on_timer_timeout():
	hunger -= 0.25
	if hunger <= 0:
		Starve()
