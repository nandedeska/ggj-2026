extends Node2D

var cutscenes = [
	"cutscene1",
	"cutscene2",
	"cutscene3"
]

var currScene:int = 0

func _ready() -> void:
	$Timer.connect("timeout",startScenes)

func startScenes()->void:
	$fadeItem/fadePlayer.connect("animation_finished",fadeFinish)
	$fadeItem/fadePlayer.play("fadeIn")
	$cutscenePlayer.connect("animation_finished",progressCut)
	$cutscenePlayer.play(cutscenes[currScene])

func progressCut(animName:StringName)->void:
	$fadeItem/fadePlayer.play("fadeOut")

func fadeFinish(animName:StringName)->void:
	if animName == "fadeOut":
		if currScene < (cutscenes.size()-1):
			currScene += 1
			$fadeItem/fadePlayer.play("fadeIn")
			$cutscenePlayer.play(cutscenes[currScene])
		else:
			var scene:PackedScene = load("res://scenes/LEVEL_ONE.tscn")
			get_tree().change_scene_to_packed(scene)
