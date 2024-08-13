extends NinePatchRect

func _on_shop_toggle_toggled(toggled_on):
	$VBoxContainer/Label2.text = "Money: "+str(Money.money)
	if toggled_on:
		$"../AnimationPlayer".play("Open Shop")
	else:
		$"../AnimationPlayer".play("Close Shop")
