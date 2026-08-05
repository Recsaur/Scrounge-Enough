extends CharacterBody2D

@onready var InteractPivot = $InteractPivot

var SPEED = 1000.0
const JUMP_VELOCITY = -400.0
const DASH_SPEED = 2250

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	#velocity = direction * SPEED
	if get_global_mouse_position().x > position.x:
		$Sprite2D.flip_h = false
	else:
		$Sprite2D.flip_h = true
	print(direction)
	match direction:
		Vector2.LEFT:
			InteractPivot.rotation_degrees = 90
		Vector2.RIGHT:
			InteractPivot.rotation_degrees = 270
		Vector2.UP:
			InteractPivot.rotation_degrees = 180
		Vector2.DOWN:
			InteractPivot.rotation_degrees = 0
	
	velocity = velocity.lerp(direction*SPEED,15*delta)
	move_and_slide()
