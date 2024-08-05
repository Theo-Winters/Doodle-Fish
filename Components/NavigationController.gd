extends Node2D
class_name NavigationController

@export var stomach: HungerController
var parent: CharacterBody2D
var preferedY: int = 250
var depth: int

func _ready():
	parent = self.get_parent()
	parent.velocity = Vector2(randi_range(-40, 40), 0)
	depth = preferedY + randi_range(-150, 150)

func _process(delta):
	Swim()
	parent.move_and_slide()

#TODO: Add variety to the swimming so they don't all stack.
#TODO: Add randomness to turn around before glass
func Swim():
	if get_tree().has_group("food") and stomach.hunger < 75:
		var foodToGet = get_tree().get_nodes_in_group("food")
		var foodindex = foodToGet[0]
		var dir = Vector2(-(parent.position.x - foodindex.position.x), -(parent.position.y - foodindex.position.y))
		#dir.normalized()
		parent.velocity = dir
	else:
		parent.velocity.y = depth - parent.position.y
	
	var chanceToTurn = randi() % 1000
	if parent.position.x <= 50 or chanceToTurn >= 998:
		parent.velocity.x = 40
	elif parent.position.x >= 1100 or chanceToTurn <= 1:
		parent.velocity.x = -40
		
#TODO: Move this to it's own fucntion.
	if parent.velocity.x > 0:
		$"../Sprite2D".flip_h = true
	else:
		$"../Sprite2D".flip_h = false

func _on_area_2d_body_entered(body):
	if body is FoodEntity:
		body.queue_free()
		stomach.hunger += 10
		parent.velocity.x = randi_range(-40, 40)
