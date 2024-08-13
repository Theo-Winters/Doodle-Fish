extends Node2D
class_name GrowthController


@export var max_size: float = 2.0
@export var HoursToGrow: float
var OneHour: float = 3600 / max_size
var GrowthSpeed: float
@export var hunger: HungerController
@export var randomness: float
var growth: float = 0
var fish_max: float
var percent_grown: float
var min_fish_size: float = 0.3

func _ready():
	fish_max = max_size + randf_range(-randomness, randomness)
	GrowthSpeed = HoursToGrow * OneHour
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if growth <= fish_max and hunger.hunger >= 50: growth += delta / GrowthSpeed
	else: growth = fish_max
	var scale = Vector2(max(min_fish_size, growth * 0.5), max(min_fish_size, growth * 0.5))
	$"../CollisionShape2D".scale = scale * 0.9
	$"../NavigationController".scale = scale
	$"../Sprite2D".scale = scale * 0.75
	percent_grown = growth / fish_max

func set_growth(value: float, time):
	value += time * ((1/60) / (HoursToGrow * OneHour)) * 60
	growth = value
