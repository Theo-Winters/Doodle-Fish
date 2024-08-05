extends Node2D

@onready var food = preload("res://Scenes/food.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	SaveGame.load_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer/Label.text = "Money: "+str(Money.money)


func _on_button_pressed():
	var foodItem = food.instantiate()
	foodItem.position = Vector2(550, 50)
	add_child(foodItem)
