extends Node2D


var description = "Increase the star's cooldown by 1 second"

func newStuff():
	get_tree().get_first_node_in_group("map").coolTime += 1
	
