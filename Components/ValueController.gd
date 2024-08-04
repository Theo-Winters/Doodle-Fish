extends Node2D
class_name ValueController

@export var FishSize: GrowthController
@export var BaseValue: int
@export var MaxValue: int
var value: int

# Called when the node enters the scene tree for the first time.
func _ready():
	value = BaseValue

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if value <= MaxValue:
		value = lerp(BaseValue, MaxValue, FishSize.percent_grown)
