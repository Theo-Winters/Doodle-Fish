extends Button

@export var FishToBuy = preload("res://Scenes/fish.tscn")
@export var buy_value: int

func _ready():
	var tempFish = FishToBuy.instantiate()
	self.icon = tempFish.get_sprite()
	if tempFish.has_method("get_buy_value"):
		buy_value = tempFish.get_buy_value()
	self.text = "Buy $" + str(buy_value)
	tempFish.queue_free()


func _on_pressed():
	if Money.remove_money(buy_value):
		var fishItem = FishToBuy.instantiate()
		fishItem.position = Vector2(550, 150)
		get_node("/root/Test Scene").add_child(fishItem)
