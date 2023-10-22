extends Node2D


var buttonNum = 3
@onready var shop = $CanvasLayer/HBoxContainer

@onready var button1 = $CanvasLayer/HBoxContainer/Button
@onready var button2 = $CanvasLayer/HBoxContainer/Button2
@onready var button3 = $CanvasLayer/HBoxContainer/Button3

func _ready():
	get_tree().paused = true

	selectUpgrades(button1)
	selectUpgrades(button2)
	selectUpgrades(button3)
	


func _on_button_button_down():

	button1.get_child(0).newStuff()
	button1.get_child(1).newStuff()
	get_tree().paused = false
	queue_free()


func _on_button_3_button_down():

	button3.get_child(0).newStuff()
	button3.get_child(1).newStuff()
	get_tree().paused = false
	queue_free()


func _on_button_2_button_down():

	button2.get_child(0).newStuff()
	button2.get_child(1).newStuff()
	get_tree().paused = false
	queue_free()


func selectUpgrades(button):
	var downSide = DirAccess.get_files_at("res://upgrades/downside/")
	var upgrade = DirAccess.get_files_at("res://upgrades/upgrades/")
	
	var selectDownSide = randi_range(0, downSide.size() - 1)
	var selectUpgrade = randi_range(0, upgrade.size() - 1)
	
	var newUpgrade = upgrade[selectUpgrade]
	var newDownSide = downSide[selectDownSide]
	
	var thisUpgrade = load("res://upgrades/upgrades/" + newUpgrade)
	var currentUpgrade = thisUpgrade.instantiate()
	button.add_child(currentUpgrade)
	
	var thisDownside = load("res://upgrades/downside/" + newDownSide)
	var currentDownside = thisDownside.instantiate()
	button.add_child(currentDownside)
	
	
	
	button.text = currentUpgrade.description + "\n BUT \n" + currentDownside.description
	
