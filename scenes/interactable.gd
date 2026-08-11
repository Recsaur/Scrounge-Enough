extends Area2D
@onready var sprite = $"../Sprite2D"
@onready var act_label = $"../Label"
var player_near = false


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_near:
		sprite.play("swing_open")


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		act_label.show()
		player_near = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		act_label.hide()
		player_near = false
