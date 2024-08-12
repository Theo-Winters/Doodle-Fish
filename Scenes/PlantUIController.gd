extends Node2D

@export var value: int

func _on_button_pressed():
	Money.add_money(value)
	self.get_parent().queue_free()
