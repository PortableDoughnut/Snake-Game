extends Node2D

@onready var options_preload = preload("res://Scenes/options.tscn")

var options


# Called when the node enters the scene tree for the first time.
func _ready():
	options = options_preload.instantiate()
	options.connect("options_back", options_back)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/level.tscn")


func _on_quit_pressed():
	get_tree().quit()


func options_back():
	remove_child(options)


func _on_options_pressed():
	add_child(options)
