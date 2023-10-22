extends Node2D

@onready var player = preload("res://plane.tscn")
@onready var scoreBoard = $CanvasLayer/Label
var levelScreen = preload("res://level_up_screen.tscn")
var shooter = preload("res://fire_point.tscn")
var score = 0
var nextLevel = 10

var battLife = 100
@onready var battMeter = $CanvasLayer/TextureProgressBar
@onready var timer = $CanvasLayer/Timer
var maxBatt = 100
var depletionRate = 10
var morePower = 2
var maxDropOff = 5
var dropOff = 0
var coolTime = 2
@onready var deathScreen = preload("res://death_scene.tscn")
@onready var containerInfo = $CanvasLayer/Label2
func _ready():
	pass

func _process(delta):
	if get_tree().has_group("player") == false:
		var newPlayer = player.instantiate()
		add_child(newPlayer)
		
	scoreBoard.text = "Score:  " + var_to_str(score)
	battMeter.value = battLife
	if battLife >= maxBatt:
		battLife = maxBatt
		
	containerInfo.text = " Processing: " + var_to_str(dropOff) + "/" + var_to_str(maxDropOff) + "\n Cooldown time: " + var_to_str(coolTime) + "\n Next lvl at: " + var_to_str(nextLevel) 
	
	if Input.is_action_just_pressed("click"):
		timer.start(1)
	if Input.is_action_just_released("click"):
		timer.stop()
		
	if score >= nextLevel:
		nextLevel = nextLevel * 2
		var newScreen = levelScreen.instantiate()
		add_child(newScreen)
	if dropOff >= maxDropOff and $dropOff.prepared == true:
		$dropOff.prepared = false
		coolDown()
		
	if get_tree().has_group("shooter") == false:
		newArm()
		
	$CanvasLayer/Label3.text = var_to_str(battLife) + "%"



func _on_timer_timeout():
	battLife -= depletionRate

func newArm():
	print("new arm")
	var newShooter = shooter.instantiate()
	add_child(newShooter)


func coolDown():
	$dropOff.timer.start(coolTime)
	$dropOff.particles.emitting = false

func die():
	var newDeath = deathScreen.instantiate()
	add_child(newDeath)
	get_tree().paused = true
	
