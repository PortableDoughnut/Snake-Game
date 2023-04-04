# This script inherits from the Node class, a general-purpose scene node.
extends Node

# Preload the food scene and store it in the 'food' variable.
@onready var food = preload("res://Scenes/food.tscn")
#Preload the audio scene and store it in the 'audio_preload' variable
@onready var audio_preload = preload("res://Scenes/audio.tscn")

# Initalize the varible audio
var audio
# Initalize the varible eat
var music
# Initalize the varible eat
var eat
# Initialize the score variable to 0.
var score = 0

# The _ready function is called when the node and its children are added to the active scene.
func _ready():
	audio = audio_preload.instantiate()
	add_child(audio)
	music = $Audio/Moonlight
	eat = $Audio/Bloop
	
	add_food()
	start_music()

# Function to start playing the background music.
func start_music():
	music.play()

# The _process function is called every frame, with 'delta' being the time since the last frame.
func _process(_delta):
	# Update the score text in the 'Overlay' node.
	$Overlay/Score.text = "Points: " + (str(score))

# Function to add food to the game scene.
func add_food():
	# Create an instance of the food scene.
	var instance = food.instantiate()
	# Set the position of the food instance to a random location within a defined range.
	instance.position = Vector2(randf_range(500, 50), randf_range(500, 50))
	# Connect the 'Food_used' signal to the 'spawn_new' function.
	instance.connect("Food_used", spawn_new)
	# Add the food instance as a child of this node.
	call_deferred("add_child", instance)
	# Play the 'eat' sound effect.
	eat.play()

# Function to spawn a new food item and increase the score.
func spawn_new():
	# Increment the score by 5.
	score += 5
	# Add a new food item to the scene.
	add_food()
	# Call the 'add_tail' function of the 'Snake' node to add a new tail segment.
	get_node("Snake").add_tail()
