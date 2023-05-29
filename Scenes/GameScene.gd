extends Node2D


func _ready():
	$AnimationPlayer.play("Camera_A")
#	get_node("HUD/Interface_A/Teleporter").connect("pressed", self,"on_teleporter_pressed")
	$MusicA.play()
func _process(delta):
	if Input.is_action_just_pressed("teleport"):
		if GameData.on_dimension_A == false:
			$teleport.play()
			$AnimationPlayer.stop()
			$AnimationPlayer.play("CameraB")
			$AnimationPlayer.seek(0.0)
			$TransitionScreen.transition()
			yield(get_tree().create_timer(1),"timeout")
			get_node("DimensionA").visible = false
			get_node("HUD/Interface_A").visible = false
			$MusicA.stop()
			$MusicB.play()
			get_node("HUD/Interface_B").visible = true
			get_node("DimensionB").visible = true
			GameData.on_dimension_A = true

		else:
			$teleport.play()
			$AnimationPlayer.stop()
			$AnimationPlayer.play("Camera_A")
			$AnimationPlayer.seek(0.0)
			$TransitionScreen.transition()
			yield(get_tree().create_timer(1),"timeout")
			get_node("DimensionA").visible = true
			get_node("HUD/Interface_A").visible = true
			$MusicA.play()
			$MusicB.stop()
			get_node("HUD/Interface_B").visible = false
			get_node("DimensionB").visible = false
			GameData.on_dimension_A = false


