extends Node2D

var description = "Increase your magnet's radius by 50%"
func newStuff():
	get_tree().get_first_node_in_group("player").magnet.scale *= 1.5
	print("works")
