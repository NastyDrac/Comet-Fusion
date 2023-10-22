extends RigidBody2D

class_name bullet

var destination : Vector2
var closeEnough = false
var capture = false
var velocity
var player
var caught = false

func _ready():
	destination = get_global_mouse_position() 
	velocity = global_position.direction_to(destination) * inertia
	player = get_tree().get_first_node_in_group("player")
	
	var size = randf_range(.9, 1.1)
	scale = Vector2(size, size)
	
	var meteor = randi_range(0,1)
	if meteor == 1:
		$Icon.texture = load("res://meteor1.png")
	else:
		$Icon.texture = load("res://meteor2.png")

func _process(delta):
	if Input.get_action_strength("click") and closeEnough == true and get_parent().battLife > 0:
		destination = get_global_mouse_position()
		velocity = global_position.direction_to(destination) * inertia
		caught = true
	


		
	if Input.is_action_just_released("click") and closeEnough == true and capture == true:
		queue_free()
		get_parent().score += 1
		get_parent().battLife += get_parent().morePower
		get_parent().dropOff += 1



func _physics_process(delta):
	move_and_collide(velocity)
	
	
func _on_timer_timeout():
	if closeEnough != true:
		queue_free()


func disappear():
	queue_free()
