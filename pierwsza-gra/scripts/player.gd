extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
var cooldown = 0;
var if_alive = 1;
var if_wants_kiss = 0;
var life_saved = 0;
var times_life_saved = 0;
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight


func _physics_process(delta: float) -> void:
	cooldown += delta
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("jump_p1") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var direction := Input.get_axis("move_left_p1", "move_right_p1")
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	if if_alive == 0:
		return
	
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x,0,SPEED)
		
	move_and_slide()

	if ray_cast_left.is_colliding() or ray_cast_right.is_colliding():
		var collider = ray_cast_left.get_collider()
		if collider is CharacterBody2D:
			if Input.is_action_just_pressed("kiss_p1"):
				if (collider.if_wants_kiss):
					if_wants_kiss = 0;
					collider.if_wants_kiss = 0;
					life_saved = 1;
					collider.life_saved = 1;
				else:
					print("Player 1 wants a kiss!")
					if_wants_kiss = 1;
