extends Node2D


var isDrawing = false
var startingBoxPosition : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Input.is_action_pressed("mouse_left"):
		if (!isDrawing):
			startingBoxPosition = get_local_mouse_position()
			isDrawing = true


		if (isDrawing):
			$ColorRect.position = startingBoxPosition
			$ColorRect.size = get_local_mouse_position() - startingBoxPosition
			if (get_local_mouse_position().x - startingBoxPosition.x < 0):
				$ColorRect.position.y = startingBoxPosition.y
				$ColorRect.position.x = get_local_mouse_position().x
				$ColorRect.size.x =  startingBoxPosition.x - get_local_mouse_position().x
			if (get_local_mouse_position().y - startingBoxPosition.y < 0):
				$ColorRect.position.y = get_local_mouse_position().y
				$ColorRect.size.y =  startingBoxPosition.y - get_local_mouse_position().y

	if Input.is_action_just_released("mouse_left"):
		isDrawing = false
		$ColorRect.position = Vector2.ZERO
		$ColorRect.size = Vector2.ZERO
