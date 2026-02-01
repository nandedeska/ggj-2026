extends CanvasLayer

@export var label: Label

func _ready() -> void:
	Global.player.on_mask_wear.connect(on_player_mask_wear)
	
func on_player_mask_wear(is_wearing_mask: bool) -> void:
	label.visible = true
