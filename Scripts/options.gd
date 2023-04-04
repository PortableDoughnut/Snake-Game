extends CanvasLayer

signal options_back

func _on_back_pressed():
	emit_signal("options_back")
