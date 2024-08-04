extends Node2D
class_name GrowthController

@export var GrowthSpeed: int = 300
@export var hunger: HungerController
@export var max_size: float
@export var randomness: float
var growth: float = 0.5
var fish_max: float
var percent_grown: float

func _ready():
	fish_max = max_size + randf_range(-randomness, randomness)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if growth <= fish_max and hunger.hunger >= 50:
		growth += delta / GrowthSpeed
	else:
		growth = fish_max
	var scale = Vector2(growth * 0.5, growth * 0.5)
	$"../CollisionShape2D".scale = scale * 0.9
	$"../NavigationController".scale = scale
	$"../Sprite2D".scale = scale * 0.025
	percent_grown = growth / fish_max
