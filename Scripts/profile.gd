extends Control

var is_profile_open = false : set = set_is_profile_open

func _unhandled_input(event):
	if event.is_action_pressed("open_profile"):
		self.is_profile_open = !is_profile_open

func set_is_profile_open(value):
	is_profile_open = value
	get_tree().paused = is_profile_open
	visible = is_profile_open

func _on_resume_pressed():
	self.is_profile_open = false
	visible = false
