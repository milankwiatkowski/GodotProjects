extends Area2D

func _on_body_entered(body: Node2D) -> void:

	body.if_alive = 0
	body.velocity = Vector2.ZERO

	var sprite = body.get_node("AnimatedSprite2D")
	if body.life_saved == 1:
		if body.times_life_saved < 3:
			body.set_deferred("global_position", Vector2(56, -16))
			body.times_life_saved += 1;
			body.life_saved = 0;
	else:
		sprite.animation_finished.connect(_on_death_animation_finished)
		sprite.play("death")


func _on_death_animation_finished():
	await get_tree().create_timer(1.0).timeout
	get_tree().reload_current_scene()
