extends Area2D

@export var sprite: Sprite2D
@export var oscillation_speed := 7.7
@export var oscillation_power := 1.5
var time: float

func _ready() -> void:
	body_entered.connect(on_body_entered)

func _process(delta: float) -> void:
	time += delta
	sprite.position.y = sin(time * oscillation_speed) * oscillation_power
	
func on_body_entered(body: Node2D) -> void:
	if body == Global.player:
		Global.player.has_mask = true
		Global.player.is_wearing_mask = true
		call_deferred("queue_free")
