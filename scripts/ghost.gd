extends CharacterBody2D

@export var speed := 75
@export var sprite: AnimatedSprite2D
var is_active: bool

func _ready() -> void:
	Global.player.on_mask_wear.connect(on_player_mask_wear)
	set_physics_process(false)
	
	sprite.visible = false

func _physics_process(delta: float) -> void:
	var direction := (Global.player.position - position).normalized()
	velocity = direction * speed
	
	move_and_slide()
	
func on_player_mask_wear(is_wearing_mask: bool) -> void:
	set_physics_process(is_wearing_mask)
	sprite.visible = is_wearing_mask
