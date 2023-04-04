extends Area2D

var cur_dir = Vector2(0, 0)
var directions = []
var position_array = []


func _ready():
	print("Tail Script Ready")



func _process(delta):
	position += cur_dir/2
	if directions.size() > 0:
		if(position == position_array[0]):
			cur_dir = directions[0]
			remove_from_tail()


func remove_from_tail():
	directions.pop_front()
	position_array.pop_front()


func add_tail_part(head_position, dir):
	position_array.append(head_position)
	directions.append(dir)


func _on_area_entered(area):
	if area.name == "Head":
		get_tree().reload_current_scene()
