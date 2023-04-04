extends Control

const OPTIONS = preload("res://Scenes/options.tscn")

var is_paused = false : set = set_is_paused
var options


func _ready():
	options = OPTIONS.instantiate()
	options.connect("go_back", options_back)


func _process(delta):
	pass


func _unhandled_input(event):
	if event.is_action_pressed("ui_menu"):
		self.is_paused = !is_paused


func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused


func _on_resume_pressed():
	self.is_paused = false


func _on_quit_pressed():
	get_tree().quit()


func _on_options_pressed():
	add_child(options)

func options_back():
	remove_child(options)
