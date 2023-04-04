extends Node2D

var direction = Vector2(5, 0)
@export var gap = -7
var next_tail_direction = Vector2(1, 0)
var previous_direction = Vector2(1, 0)

@onready var tail = preload("res://Scenes/tail.tscn")

func _ready():
	pass

func _process(_delta):
	if Input.is_action_just_pressed("ui_up") and direction != Vector2(0, 5):
		direction = Vector2(0, -5)
	elif Input.is_action_just_pressed("ui_down") and direction != Vector2(0, -5):
		direction = Vector2(0, 5)
	elif Input.is_action_just_pressed("ui_left") and direction != Vector2(5, 0):
		direction = Vector2(-5, 0)
	elif Input.is_action_just_pressed("ui_right") and direction != Vector2(-5, 0):
		direction = Vector2(5, 0)
	move_snake()

func move_snake():
	var head_position = get_node("Head").position
	get_node("Head").position += direction/2

	var direction_change = false
	if previous_direction != direction:
		previous_direction = direction
		direction_change = true
	if direction_change:
		for i in range(1, get_child_count()):
			# Rename the method to add_tail_part
			get_child(i).add_tail_part(head_position, direction)

func add_tail():
	var instance = tail.instantiate()
	var previous_tail = get_child(get_child_count()-1)
	if previous_tail.name != "Head":
		instance.cur_dir = previous_tail.cur_dir
		for i in range(0, previous_tail.position_array.size()):
			instance.position_array.append(previous_tail.position_array[i])
			instance.directions.append(previous_tail.directions[i])
		instance.position =  previous_tail.position + previous_tail.cur_dir * gap
	else:
		instance.cur_dir = direction
		instance.position = previous_tail.position + direction * gap
	call_deferred("add_child", instance)


func _on_head_area_entered(area):
	if area.name == "Boundary":
		get_tree().reload_current_scene()
