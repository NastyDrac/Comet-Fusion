extends Sprite2D

var prepared = true
@onready var timer = $Timer
@onready var player = preload("res://plane.tscn")
@onready var particles = $CPUParticles2D

	
func _process(delta):

	if prepared == false:
		modulate.b = 0
	else :
		modulate.b = 255
		
	

func _on_area_2d_body_entered(body):
	if body.is_in_group("bullet") and prepared == true:
		body.capture = true


func _on_area_2d_body_exited(body):
	if body.is_in_group("bullet"):
		body.capture = false


func _on_timer_timeout():
	get_parent().dropOff = 0
	particles.emitting = true
	print("start")
	prepared = true

