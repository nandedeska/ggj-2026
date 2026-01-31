extends Area2D

@export var sprite: Sprite2D
@export var oscillation_speed := 7.7
@export var oscillation_power := 1.5
var time: float

func _ready() -> void:
	area_entered.connect(on_area_entered)

func _process(delta: float) -> void:
	time += delta
	sprite.position.y = sin(time * oscillation_speed) * oscillation_power
	
func on_area_entered(area: Area2D) -> void:
	if area.owner == Global.player:
		Global.player.has_mask = true
		Global.player.is_wearing_mask = true
		call_deferred("queue_free")
