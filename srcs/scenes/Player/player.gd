extends CharacterBody2D
class_name Player
@export var speed = 1200
@export var jump_speed = -1000
@export var gravity = 4000
@export var jump_buffer := 0.1
@export_range(0.0, 1.0) var friction = 0.5
@export_range(0.0 , 1.0) var acceleration = 0.5

@onready var anim_sprite :AnimatedSprite2D= $AnimatedSprite2D

var jump_buffer_timer := 0.0
func _physics_process(delta):
	velocity.y += gravity * delta
	var dir = Input.get_axis("walk_left", "walk_right")
	if dir != 0:
		anim_sprite.play("walk")
		if dir < 0:
			anim_sprite.flip_h = true
		elif dir > 0:
			anim_sprite.flip_h = false
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		anim_sprite.play("idle")
		velocity.x = lerp(velocity.x, 0.0, friction)

	move_and_slide()
	
	if not is_on_floor():
		anim_sprite.play("fall")

	jump_buffer_timer = max(0, jump_buffer_timer - delta)
	
	if Input.is_action_just_pressed("jump"):
		jump_buffer_timer = jump_buffer
	
	if is_on_floor() and jump_buffer_timer > 0.01:
			velocity.y = jump_speed

	
	if not Input.is_action_pressed("jump") and velocity.y < 0:
		velocity.y *= 0.8
		
func kill():
	get_tree().reload_current_scene()
