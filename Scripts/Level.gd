extends Node

@onready var food = preload("res://Scenes/food.tscn")
@onready var music = $Moonlight
@onready var eat = $Bloop

var score = 0


func _ready():
	add_food()
	start_music()

func start_music():
	music.play()

func _process(delta):
	$Overlay/Score.text = "Points: " + (str(score))
	
func add_food():
	var instance = food.instantiate()
	instance.position = Vector2(randf_range(500, 50), randf_range(500, 50))
	instance.connect("Food_used", spawn_new)
	add_child(instance)
	eat.play()
	
func spawn_new():
	score += 5
	add_food()
	get_node("Snake").add_tail()
