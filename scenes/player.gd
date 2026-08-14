extends CharacterBody2D

@onready var InteractPivot = $InteractPivot
@onready var InteractCollision = $InteractPivot/interact/CollisionShape2D
@onready var KickCollision = $InteractPivot/kick/CollisionShape2D
@onready var KickCooldown = $InteractPivot/KickCooldown

var SPEED = 1000.0
const JUMP_VELOCITY = -400.0
const DASH_SPEED = 2250
var kick = true
@onready var sprite = $Sprite2D

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	#velocity = direction * SPEED
	#if get_global_mouse_position().x > position.x:
		#sprite.flip_h = true
	#else:
		#sprite.flip_h = false
	#print(direction)
	if direction != Vector2.ZERO:
		match direction:
			Vector2.LEFT:
				InteractPivot.rotation_degrees = 90
				sprite.flip_h = false
				sprite.play("WalkSide")
			Vector2.RIGHT:
				InteractPivot.rotation_degrees = 270
				sprite.flip_h = true
				sprite.play("WalkSide")
			Vector2.UP:
				InteractPivot.rotation_degrees = 180
				sprite.play("WalkBack")
			Vector2.DOWN:
				InteractPivot.rotation_degrees = 0
				sprite.play("WalkFront")
	else:
		sprite.stop()
			
	if Input.is_action_just_pressed("interact"):
		InteractCollision.disabled = false
	
	if Input.is_action_just_pressed("kick") and kick:
		KickCollision.disabled = false
		kick = false
		KickCooldown.start()
	velocity = velocity.lerp(direction*SPEED,15*delta)
	move_and_slide()


#func _on_interact_area_entered(area: Area2D) -> void:
	#print(area)
	#if area.is_in_group("Interactable"):
		#if area.has_method("ShowInteract"):
			#area.ShowInteract(true)
	#pass # Replace with function body.
#
#
#func _on_interact_area_exited(area: Area2D) -> void:
	#if area.is_in_group("Interactable"):
		#if area.has_method("ShowInteract"):
			#area.ShowInteract(false)


func _on_kick_cooldown_timeout() -> void:
	kick = true
	pass # Replace with function body.
