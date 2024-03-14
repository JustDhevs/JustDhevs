extends CharacterBody2D

@export var speed: int = 10

var direction: Vector2 = Vector2.ZERO

func _unhandled_input(event):
	if event.is_action_pressed("DOWN"):
		direction.y = 1
	if event.is_action_released("DOWN"):
		direction.y = 0
	if event.is_action_pressed("UP"):
		direction.y = -1
	if event.is_action_released("UP"):
		direction.y = 0
	if event.is_action_pressed("RIGHT"):
		direction.x = 1
	if event.is_action_released("RIGHT"):
		direction.x = 0
	if event.is_action_pressed("LEFT"):
		direction.x = -1
	if event.is_action_released("LEFT"):
		direction.x = 0
	if event.is_action_pressed("INTERACT") and $Item.texture == preload("res://Laser Sprites/22.png")  :
		var bullet = preload("res://bullet.tscn")
		var newBullet = bullet.instantiate()
		get_parent().add_child(newBullet)
		newBullet.global_position = $Item/BulletPos.global_position
	
func _process(delta):

		global_position += direction * speed
		
