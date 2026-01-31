extends CharacterBody2D

@export var speed := 75
@export var player: Node2D
var is_active: bool

func _physics_process(delta: float) -> void:
	var direction := (player.position - position).normalized()
	velocity = direction * speed
	
	move_and_slide()
