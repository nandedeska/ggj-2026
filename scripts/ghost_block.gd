extends AnimatableBody2D

@export var collider: CollisionShape2D
@export var sprite: Sprite2D
var maskOn: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void: #default state of ghost block here is active (mask is on)
	collider.disabled = true
	$Area2D.body_entered.connect(on_body_entered)
	sprite.modulate = Color8(255, 255, 255, 0) #all instances of this code can be replaced with whatever indication that a ghost block hitbox is active
	Global.player.on_mask_wear.connect(on_player_mask_wear)

func on_body_entered(body: Node2D) -> void:
	if body == Global.player:
		$AnimationPlayer.play("up")

func on_player_mask_wear(is_wearing_mask: bool) -> void:
	collider.set_deferred("disabled", !is_wearing_mask)
	sprite.set_deferred("modulate", Color8(255, 255, 255, 0) if !is_wearing_mask else "white")
