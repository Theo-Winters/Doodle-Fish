extends Button

@export var FishToBuy = preload("res://Scenes/fish.tscn")
var buy_value: int

func _ready():
	var tempFish = FishToBuy.instantiate()
	self.icon = tempFish.get_sprite()
	buy_value = tempFish.get_buy_value()
	self.text = "Buy $" + str(tempFish.get_buy_value())
	tempFish.queue_free()


func _on_pressed():
	if Money.remove_money(buy_value):
		var fishItem = FishToBuy.instantiate()
		fishItem.position = Vector2(550, 150)
		get_tree().get_root().add_child(fishItem)
