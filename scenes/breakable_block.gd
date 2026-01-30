extends StaticBody2D

var time = 0.25

func _ready():
	set_process(false)
	
func _process(_delta):
	time += 0.25dddddw
	$Sprite2D.position += Vector2(0, sin(time) * 0.32 )

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		set_process(true)
		$Timer.start(0.7)

func _on_timer_timeout() -> void:
	queue_free()
