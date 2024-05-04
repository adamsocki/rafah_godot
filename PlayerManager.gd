extends Node

var playerCamera : Camera3D
var cameraPanSpeed = 30
var cameraZoomSpeed = 10

#var player


signal UpdatedPlayerPostion(newPosition)



func InitPlayerManager():
	pass
	#player = $player


func UpdatePlayerManager(delta):
	HandlePlayerInput(delta)



func HandlePlayerInput(delta):
	#### Camera ####
	var positionToMove: Vector3
	
	if Input.is_action_pressed("key_w"):
		positionToMove += Vector3.FORWARD * delta * cameraPanSpeed
	if Input.is_action_pressed("key_a"):
		positionToMove += Vector3.LEFT    * delta * cameraPanSpeed
	if Input.is_action_pressed("key_s"):
		positionToMove += Vector3.BACK    * delta * cameraPanSpeed
	if Input.is_action_pressed("key_d"):
		positionToMove += Vector3.RIGHT   * delta * cameraPanSpeed
		
	if Input.is_action_just_pressed("mouse_wheel_up"):
		positionToMove += Vector3.UP     * delta * cameraZoomSpeed
	if Input.is_action_just_pressed("mouse_wheel_down"):
		positionToMove += Vector3.DOWN   * delta * cameraZoomSpeed
		
	if Input.is_action_pressed("key_q"):
		positionToMove += Vector3.UP     * delta * cameraZoomSpeed
	if Input.is_action_pressed("key_e"):
		positionToMove += Vector3.DOWN   * delta * cameraZoomSpeed
		
	UpdatedPlayerPostion.emit(positionToMove)
	# @TODO: check player distance to floor
	
	
	
	
	
	
