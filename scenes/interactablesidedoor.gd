extends Area2D
@onready var sprite = $"../Sprite2D"
@onready var act_label = $"../Label"
@onready var col_hitbox = $"../CollisionShape2D"
var player_near = false
var alrdy_use = false

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_near and not alrdy_use:
		alrdy_use = true
		sprite.play("swing_open")
		AudioHandler.OpenDoor()
		await get_tree().create_timer(0.125).timeout
		col_hitbox.disabled = true
		$"../CollisionShape2D2".disabled = false
		sprite.modulate = Color(1,1,1)
		act_label.hide()
	#if Input.is_action_just_pressed("paw1bounce")
	#I had an idea to make like keybind/s for moving the paws up and down so like u can bounce items and play n stuff, but it would be a cool game mechanic for sumn else rightt??? 

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and not col_hitbox.disabled:
		act_label.show()
		sprite.modulate = Color(1.572, 1.572, 1.572)
		player_near = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		act_label.hide()
		sprite.modulate = Color(1,1,1)
		player_near = false


#func shake_random():
#	var tween = create_tween()
	#tween.tween_property(sprite,"postion",Vector2(sprite.position.x+randi_range(10,15),sprite.position.y+randi_range(10,15)),0.25)
	

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("kick") and not col_hitbox.disabled and not alrdy_use:
		alrdy_use = true
		GameController.emit_signal("Action",15)
		sprite.speed_scale = 2
		sprite.play("swing_open")
		AudioHandler.Slam()
		await get_tree().create_timer(0.05).timeout
		col_hitbox.set_deferred("disabled", true)
		$"../CollisionShape2D2".set_deferred("disabled",false)
		sprite.modulate = Color(1,1,1)
		act_label.hide()
