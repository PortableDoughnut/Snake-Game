extends Panel


var item_class = preload("res://Scenes/item.tscn")
var item = null


func _ready():
	if randi() % 2 == 0:
		item = item_class.instantiate()
		item.get_node("TextureRect").set_size(Vector2(50, 50))
		add_child(item)
