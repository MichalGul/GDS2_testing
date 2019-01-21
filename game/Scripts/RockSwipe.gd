extends KinematicBody2D

export (int) var swipe_friction = 1


var elapsed_time = 0
var start_pos
var speed = 0 
var start_time
var direction = Vector2(0,0)
var swipe_start

var touch_pos = Vector2(0,0)
var final_touch = Vector2(0,0)
var thrown = false
var lifted = false

onready var touched = false

#BASIC SWIPE
#check if clicked on object save position nad time otherwise set clicek to true
#to całe wyliczanie trzeba zrobić w evencie zwyklym a to czy poruszyc obiekt o wyliczenie
#czy nie to bedzie zalezalo d tego czy pierwsza pozycja była w obiekcie, ale do tego mozna zrobic oddzielna
#funkcje i potem dac tylko flage ze jak pierwsze bylo na obiekcie to daj t
#func _input_event(viewport, event, shape_idx):
#	if Input.is_mouse_button_pressed(BUTTON_LEFT):
#		thrown = true
#	else:
#		thrown = false
#	if event is InputEventScreenTouch:
#		if event.is_pressed():
#			print(event.position)
#			start_pos = event.position
#			start_time = elapsed_time
#		else:
#			direction = event.position - start_pos
#			speed = (direction.length()) / (elapsed_time - start_time)
#			direction = direction.normalized()
#			print(direction, speed)
#	if event is InputEventScreenDrag:
#
#		if (event.position - position).length() < 30:
#			thrown = true
#			direction = event.speed
#		else:
#			thrown = false
#			direction = Vector2()
#
#func calculate_swipe(start_pos, end_pos):
#	#		direction = event.position - start_pos
##			speed = (direction.length()) / (elapsed_time - start_time)
##			direction = direction.normalized()
##			print(direction, speed)
#	pass
#
#func _input(event):
#	if event is InputEventScreenTouch and event.is_pressed():
#		touch_pos = event.position
#
#	if event is InputEventScreenDrag:
#		#if (event.position - position).length() < 30:
#		#thrown = true
#		#print(event.speed)	
#		print(event.relative)
#		direction = event.speed
#
#
#func _ready():
#	# Called when the node is added to the scene for the first time.
#	# Initialization here
#	pass
#
func _process(delta):
#	if (touch_pos - position).length() > 20:
#		direction = Vector2(0,0)
#	elapsed_time += delta
#	if thrown:
#		move_and_collide(direction  * delta / swipe_friction)
	print(direction)
#
#func _on_VisibilityNotifier2D_screen_exited():
#	queue_free()
#
#
#func _on_RockSwipe_input_event(viewport, event, shape_idx):
#	pass
		

#TRY DRAG WORKAROUND

func _on_RockSwipe_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("ui_touch"):
		print("touched rock")
		touched = true

func _on_TouchArea_input_event(viewport, event, shape_idx):
	if event.is_action_released("ui_touch"):
		print("realeased rock")
		touched = false
		#apply force impulse to rigidbody
		direction = 0
		
	if touched:
		if event is InputEventScreenDrag:
			print("Player gets dragged")
			print("ply:", position)
			print("pos: ", event.position)
			print("rel: ", event.relative)
			print("vel: ", event.speed)
			direction = event.speed
			#Move the obstackle hardcode
			#position = position + event.relative
			#Move the obstackle with collision
			move_and_collide(event.relative)
			
			
			
		

#WORKING CLICK AND DRAG!!!!

#func _unhandled_input(event):
#	if event is InputEventMouseButton and not event.pressed:
#		lifted = false
#	if lifted and event is InputEventMouseMotion:
#		position += event.relative
#
#func _input_event(viewport, event, shape_idx):
#	if event is InputEventMouseButton and event.pressed:
#		lifted = true






