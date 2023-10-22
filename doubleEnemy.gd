extends Node2D

var description ="Increase the number of of comets."
func newStuff():
	get_tree().get_first_node_in_group("map").newArm()
	print("works")
