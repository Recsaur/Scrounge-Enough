extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_parent().get_node("Player").is_node_ready():
		print($Shadow.scale)
		position = get_parent().get_node("Player").position
		if GameController.left:
			position.x += 5
			$Shadow.scale.x = 2.5
		elif GameController.right:
			position.x -= 5
			$Shadow.scale.x = 2.5
		else:
			position.x = get_parent().get_node("Player").position.x
			$Shadow.scale.x = 3
