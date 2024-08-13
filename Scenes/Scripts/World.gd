extends Node2D

@onready var food = preload("res://Scenes/food.tscn")
var feeding: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	SaveGame.load_game()

func _on_button_toggled(toggled_on):
	feeding = toggled_on
	
func _unhandled_input(event):
	if event is InputEventMouseButton and feeding:
		if event.button_index == 1 and event.pressed:
			var foodItem = food.instantiate()
			foodItem.position = get_global_mouse_position()
			add_child(foodItem)
