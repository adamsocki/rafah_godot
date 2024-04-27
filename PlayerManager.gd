extends Node

var playerCamera : Camera3D
var cameraPanSpeed = 50
var cameraZoomSpeed = 100




func InitPlayerManager():
	playerCamera = get_node("Camera3D")


func UpdatePlayerManager(delta):
	HandlePlayerInput(delta)



func HandlePlayerInput(delta):
	#### Camera ####
	if Input.is_action_pressed("key_w"):
		playerCamera.position += Vector3.FORWARD * delta * cameraPanSpeed
	if Input.is_action_pressed("key_a"):
		playerCamera.position += Vector3.LEFT    * delta * cameraPanSpeed
	if Input.is_action_pressed("key_s"):
		playerCamera.position += Vector3.BACK    * delta * cameraPanSpeed
	if Input.is_action_pressed("key_d"):
		playerCamera.position += Vector3.RIGHT   * delta * cameraPanSpeed
		
	if Input.is_action_just_pressed("mouse_wheel_up"):
		playerCamera.position += Vector3.UP     * delta * cameraZoomSpeed
	if Input.is_action_just_pressed("mouse_wheel_down"):
		playerCamera.position += Vector3.DOWN   * delta * cameraZoomSpeed
		
	if Input.is_action_just_pressed("key_q"):
		playerCamera.position += Vector3.UP     * delta * cameraZoomSpeed
	if Input.is_action_just_pressed("key_e"):
		playerCamera.position += Vector3.DOWN   * delta * cameraZoomSpeed

