extends VBoxContainer


@export var label: String
@export var bus_name: String
@export var audio_stream_player_path: NodePath

@onready var level = preload("res://Scenes/level.tscn")
@onready var play_button = $"SFX Settings/Play"
@onready var stop_button = $"SFX Settings/Stop"

var sfx_stream_player: AudioStreamPlayer2D


func _ready():
	$Label.text = label
	sfx_stream_player = get_node("SFXTest")


func _on_volume_value_changed(value):
	var bus_idx = AudioServer.get_bus_index(bus_name)
	if value > $Volume.min_value:
		AudioServer.set_bus_mute(bus_idx, false)
		AudioServer.set_bus_volume_db(bus_idx, value)
	else:
		AudioServer.set_bus_mute(bus_idx, true)


func _on_play_pressed():
	sfx_stream_player.play()
	play_button.disabled = true
	stop_button.disabled = false


func _on_stop_pressed():
	sfx_stream_player.stop()
	stop_button.disabled = true
	play_button.disabled = false
