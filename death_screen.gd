extends Node2D


@onready var newGame = preload("res://map.tscn")

func _on_button_toggled(button_pressed):
	
	get_tree().reload_current_scene()
	get_tree().paused = false
	get_tree().get_first_node_in_group("map").score = 0
	get_tree().get_first_node_in_group("map").battLife = 100
	get_tree().get_first_node_in_group("map").nextLevel = 20
	get_tree().get_first_node_in_group("map").dropOff = 0
	get_tree().get_first_node_in_group("map").coolTime = 2
	get_tree().get_first_node_in_group("map").nextLevel = 5
	get_tree().call_group("bullet", "disappear")
	get_tree().call_group("shooter", "disappear")
	get_tree().get_first_node_in_group("player").magnet.scale = get_tree().get_first_node_in_group("player").magScale
	queue_free()
	
func _ready():
	$AnimationPlayer.play("death")
