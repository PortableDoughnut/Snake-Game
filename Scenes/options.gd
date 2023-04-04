extends Control

signal go_back
signal music_toggle

@export var music_value = true

var is_fullscreen = false


func _ready():
	pass 



func _process(delta):
	pass


func _on_back_pressed():
	emit_signal("go_back")


func _on_fullscreen_pressed():
	is_fullscreen = !is_fullscreen
	if is_fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
