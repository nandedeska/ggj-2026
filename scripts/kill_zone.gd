extends Area2D

@onready var timer: Timer = $Timer
@onready var animation: AnimationPlayer = $DeathTransition/AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	timer.start()
	animation.play("out")
	await animation.animation_finished

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	animation.play_backwards("out")
