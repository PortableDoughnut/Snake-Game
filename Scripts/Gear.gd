extends Area2D

signal Food_used

func _ready():
	pass # Replace with function body.


func _process(delta):
	pass


func _on_area_entered(area):
	if area.name == "Head":
		queue_free()
		emit_signal("Food_used")
		
