extends CanvasLayer

signal transitioned

func transition():
	$AnimationPlayer.play("fade_out")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_out":
		emit_signal("transitioned")
		$AnimationPlayer.play("fade_in")

