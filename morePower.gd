extends Node2D

var description = "Increase the power received from salvaging comets."


func newStuff():
	get_tree().get_first_node_in_group("map").morePower += 1
	
