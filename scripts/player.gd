extends CharacterBody2D

const SPEED = 125
const JUMP_VELOCITY = -300
const ACCELERATION = 19
const FRICTION = 22

var floor_contact_cayote: float = 0.0
const FLOOR_CONTACT_CAYOTE_TIME: float = 0.2

const GRAVITY_NORMAL: float = 14
const GRAVITY_WALL: float = 7
const WALL_JUMP_PUSH_FORCE: float = 100.0
 
var wall_contact_cayote: float = 0.0
const WALL_CONTACT_CAYOTE_TIME: float = 0.2

var wall_jump_lock: float = 0.0
const WALL_JUMP_LOCK_TIME: float = 0.05

var look_dir_x: int =  1

@onready var animation: AnimatedSprite2D = $Animation


func _physics_process(delta: float) -> void:
	var x_input: float = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var velocity_weight_x: float = 1 - exp( -(ACCELERATION if x_input else FRICTION)*delta)
	
	velocity.x = lerp(velocity.x, x_input * SPEED, velocity_weight_x)
	
	if is_on_floor() or wall_contact_cayote > 0.0:
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_VELOCITY
	
	if !is_on_floor() and velocity.y > 0 and is_on_wall() and velocity.x !=0:
		look_dir_x = sign(velocity.x)
		wall_contact_cayote = WALL_CONTACT_CAYOTE_TIME
		velocity.y = GRAVITY_WALL
	else:
		wall_contact_cayote -= delta
		velocity.y += GRAVITY_NORMAL
	
	move_and_slide()
