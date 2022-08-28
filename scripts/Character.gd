extends KinematicBody2D

signal jump_change

var velocity = Vector2(0, 0)
var is_jumping = false
var jump_count = 0

export var jump_limit = 2

onready var sprite = $AnimatedSprite
onready var HUD = $HUD
const WALK_SPEED = 100
const GRAVITY = 25
const JUMP_FORCE = -500

func _ready():
	HUD.update_jump(jump_limit - jump_count)
	pass

func _physics_process(delta):
	if is_jumping && velocity.y >= 0:
		is_jumping = false
	
	var snap = Vector2.DOWN * 32 if not is_jumping else Vector2.ZERO

	if Input.is_action_just_pressed("ui_up") and jump_count < jump_limit:
		is_jumping = true		
		velocity.y = JUMP_FORCE
		jump_count += 1
		HUD.update_jump(jump_limit - jump_count)

	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
		sprite.set_flip_h(true)
		sprite.play("Walk")
	elif Input.is_action_pressed("ui_right"):
		velocity.x = WALK_SPEED
		sprite.set_flip_h(false)
		sprite.play("Walk")
	else:
		sprite.play("Idle")
		
	velocity.y += GRAVITY
	velocity = move_and_slide_with_snap(velocity, snap, Vector2.UP)
	velocity.x = lerp(velocity.x, 0, 0.1)

func _on_JumpCoins_body_entered(body):
	jump_limit += 1
	HUD.update_jump(jump_limit - jump_count)
