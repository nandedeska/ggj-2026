extends PathFollow2D

@export var panSpeed: float = 0.01
var movementDone: bool = false
<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
signal nextLevel
>>>>>>> Stashed changes
=======

signal nextLevel
>>>>>>> Stashed changes

func _on_right_body_entered(body: Node2D) -> void:
	while progress_ratio < 0.99 and movementDone == false:
		progress_ratio += panSpeed
		await get_tree().create_timer(0.01).timeout
	movementDone = true
	nextLevel.emit()
<<<<<<< Updated upstream
	
=======
>>>>>>> Stashed changes
