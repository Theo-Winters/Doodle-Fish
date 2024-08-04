extends NinePatchRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_shop_toggle_toggled(toggled_on):
	print(toggled_on)
	if toggled_on:
		$AnimationPlayer.play("Open Shop")
	else:
		$AnimationPlayer.play("Close Shop")
