extends Node2D

const OPTIONS = preload("res://Scenes/options.tscn")

var options


func _ready():
	options = OPTIONS.instantiate()
	options.connect("go_back", options_back)


func _process(delta):
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/level.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_options_pressed():
	add_child(options)


func options_back():
	remove_child(options)
