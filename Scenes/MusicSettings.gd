extends VBoxContainer

@export var label: String
@export var bus_name: String
@export var audio_stream_player_path: NodePath

@onready var music_preload = preload("res://Scenes/moonlight.tscn")
@onready var play_button = $"Music Settings/Play"
@onready var stop_button = $"Music Settings/Stop"
@onready var volume_slider = $Volume  # Add this line to get a reference to the Volume slider

var music_stream_player: AudioStreamPlayer2D
var music_to_add

func _ready():
	$Label.text = label
	music_to_add = music_preload.instantiate()
	add_child(music_to_add)
	music_stream_player = get_node("Moonlight")
	
	var bus_idx = AudioServer.get_bus_index(bus_name)
	var initial_volume = AudioServer.get_bus_volume_db(bus_idx)
	volume_slider.value = initial_volume  # Set the initial value of the slider to the current volume level

func _on_volume_value_changed(value):
	var bus_idx = AudioServer.get_bus_index(bus_name)
	if value > $Volume.min_value:
		AudioServer.set_bus_mute(bus_idx, false)
		AudioServer.set_bus_volume_db(bus_idx, value)
	else:
		AudioServer.set_bus_mute(bus_idx, true)

func _on_play_pressed():
	music_stream_player.play()
	play_button.disabled = true
	stop_button.disabled = false
