extends Node2D

@onready var food = preload("res://food.tscn")
@onready var fish = preload("res://fish.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer/Label.text = "Money: "+str(Money.money)


func _on_button_pressed():
	var foodItem = food.instantiate()
	foodItem.position = Vector2(550, 50)
	add_child(foodItem)


func _on_button_2_pressed():
	if Money.remove_money(2):
		var fishItem = fish.instantiate()
		fishItem.position = Vector2(550, 150)
		add_child(fishItem)
