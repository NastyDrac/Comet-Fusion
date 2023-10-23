extends Sprite2D

@onready var deathScreen = preload("res://death_scene.tscn")
@onready var magnet = $Area2D/CollisionShape2D
@onready var ring = preload("res://mag_ring.tscn")
var magScale

func _ready():
	magScale = magnet.scale

func _physics_process(delta):
	global_position = get_global_mouse_position()
	
	
	if Input.get_action_strength("click") and get_tree().get_first_node_in_group("map").battLife > 0:
		var newRing = ring.instantiate()
		magnet.add_child(newRing)




func _on_area_2d_body_entered(body):
	if body.is_in_group("bullet"):
		body.closeEnough = true



func _on_area_2d_body_exited(body):
	if body.is_in_group("bullet"):
		body.closeEnough = false
		body.caught = false


func _on_player_body_body_entered(body):
	if body.is_in_group("bullet") and body.caught == false:
		get_parent().die()



func _on_timer_timeout():
	pass # Replace with function body.
func _process(delta):
	look_at(get_global_mouse_position())
	
