extends Node2D


func _ready():
	if randi() % 2 == 0:
		$TextureRect.texture = load("res://Textures/Black/Health.png")
	else:
		$TextureRect.texture = load("res://Textures/Black/Speed.png")
	$TextureRect.set_size(Vector2(50, 50))
