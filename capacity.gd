extends Node2D


var description = "Increase the capacity of the star 20%"

func newStuff():
	get_tree().get_first_node_in_group("map").maxDropOff = round(get_tree().get_first_node_in_group("map").maxDropOff * 1.2)
	
