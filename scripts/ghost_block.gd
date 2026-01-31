extends StaticBody2D

var maskOn: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void: #default state of ghost block here is active (mask is on) 
	get_node("CollisionShape2D").disabled = true 
	get_node("Sprite2D").modulate = "red" #all instances of this code can be replaced with whatever indication that a ghost block hitbox is active

func _input(event):
	var pressed = false
	#super sloppy toggle mask on code
	#this can be moved to player movement script, and use it to transmit a signal for all blocks to turn active instead
	#still works on its own tho
	if event.is_action_pressed("mask") and pressed == false:
		if get_node("CollisionShape2D").disabled == true:
			get_node("CollisionShape2D").disabled = false
			pressed = true
			get_node("Sprite2D").modulate = "white"
		elif get_node("CollisionShape2D").disabled == false:
			get_node("CollisionShape2D").disabled = true
			pressed = true
			get_node("Sprite2D").modulate = "red"
	if event.is_action_released("mask"):
		pressed = false
