extends Node2D


var description = "You battery depletes 20% faster."

func newStuff():
	get_tree().get_first_node_in_group("map").depletionRate *= 1.2
	
