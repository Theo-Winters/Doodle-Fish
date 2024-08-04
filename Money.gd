extends Node
class_name MoneyController

var money: int = 10

func get_money():
	return money
	
func add_money(value):
	money += value
	return money

func remove_money(value):
	if money >= value:
		money -= value
		return true
	else:
		return false
