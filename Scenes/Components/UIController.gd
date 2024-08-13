extends Node2D

@export var hunger: HungerController
@export var growth: GrowthController
@export var value: ValueController
var hungerbar: ProgressBar
var growthbar: ProgressBar
var sellbutton: Button

# Called when the node enters the scene tree for the first time.
func _ready():
	hungerbar = $Panel/HBoxContainer/VBoxContainer/CenterContainer/HungerBar
	growthbar = $Panel/HBoxContainer/VBoxContainer/CenterContainer2/GrowthBar
	sellbutton = $Panel/HBoxContainer/Button

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hungerbar.value = hunger.hunger
	growthbar.value = growth.percent_grown * 100
	sellbutton.text = "Sell: " + str(value.value)
	if get_parent().position.y < 200:
		$Panel.rotation_degrees = 180
		$Panel/HBoxContainer.rotation_degrees = 180
		$Panel/HBoxContainer.position.x = 34
		$Panel.position.y = 30
	else:
		$Panel.rotation_degrees = 0
		$Panel/HBoxContainer.rotation_degrees = 0
		$Panel/HBoxContainer.position.x = 15
		$Panel.position.y = -220

func _on_button_pressed():
	Money.add_money(value.value)
	self.get_parent().queue_free()


#TODO: Add ability to open and close each fish's UI
