extends CanvasLayer

signal options_back

var is_fullscreen = false


func _on_back_pressed():
	emit_signal("options_back")


func _on_fullscreen_pressed():
	is_fullscreen = !is_fullscreen
	if is_fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
