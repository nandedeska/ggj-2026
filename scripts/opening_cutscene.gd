extends Node2D

var cutscenes = [
	"cutscene1",
	"cutscene2",
	"cutscene3",
	"cutscene4"
]

var currScene:int = 0

func _ready() -> void:
	$Timer.connect("timeout",startScenes)

func _input(event)->void:
	if event.is_action_pressed("skip"):
		if currScene < 3:
			currScene += 1
			$AnimationPlayer.play(cutscenes[currScene])
		else:
			var scene:PackedScene = load("res://scenes/LEVEL_ONE.tscn")
			get_tree().change_scene_to_packed(scene)

func startScenes()->void:
	$AnimationPlayer.connect("animation_finished",addCut)
	$AnimationPlayer.play(cutscenes[currScene])

func addCut(animName:StringName)->void:
	if animName == "cutscene4":
		var scene:PackedScene = load("res://scenes/LEVEL_ONE.tscn")
		get_tree().change_scene_to_packed(scene)
	else:
		currScene += 1
		$AnimationPlayer.play(cutscenes[currScene])
