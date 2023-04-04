# This script inherits from the Area2D class, a 2D physics object for detecting overlap with other objects.
extends Area2D

# Declare a custom signal 'Food_used', which will be emitted when the food is used (eaten).
signal Food_used


# The _on_area_entered function is called when another Area2D node enters this Area2D node.
func _on_area_entered(area):
	# Check if the name of the entered area is "Head", implying the food has been eaten by the head object.
	if area.name == "Head":
		# Free (remove) the food object from the scene.
		queue_free()
		# Emit the "Food_used" signal to notify other nodes that the food has been used (eaten).
		emit_signal("Food_used")
