extends Area2D
@onready var sprite = $"../Sprite2D"
@onready var act_label = $"../Label"
@onready var col_hitbox = $"../CollisionShape2D"
var player_near = false


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_near:
		sprite.play("swing_open")
		col_hitbox.disabled = true
		sprite.modulate = Color(1,1,1)
		act_label.hide()


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
