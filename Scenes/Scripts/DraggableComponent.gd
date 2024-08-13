extends Node2D
class_name PlantUIComponent

@export var value: int

func _ready():
	$Panel2/MarginContainer/VBoxContainer/SellButton.text = "Sell $" + str(value)


func _on_button_pressed():
	Money.add_money(value)
	self.get_parent().queue_free()
