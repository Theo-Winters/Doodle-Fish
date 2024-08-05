extends Node2D

@export var hunger: HungerController
@export var growth: GrowthController
@export var value: ValueController
var hungerbar: ProgressBar
var growthbar: ProgressBar
var sellbutton: Button

# Called when the node enters the scene tree for the first time.
func _ready():
	hungerbar = $Panel/VBoxContainer/HungerBar
	growthbar = $Panel/VBoxContainer/GrowthBar
	sellbutton = $Panel/VBoxContainer/Button

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hungerbar.value = hunger.hunger
	growthbar.value = growth.percent_grown * 100
	sellbutton.text = "Sell:" + str(value.value)
	if get_parent().position.y < 200:
		$Panel.position.y = 30
	else:
		$Panel.position.y = -220

func _on_button_pressed():
	Money.add_money(value.value)
	self.get_parent().queue_free()


#TODO: Add ability to open and close each fish's UI
