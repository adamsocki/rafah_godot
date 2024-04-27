extends Node


@export_group("Debug Properties")
@export var debugMode: bool

@export_group("Debug Properties")
@export var vSync: bool


func InitDebugManager():
	if (vSync):
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)


func UpdateDebugManager(delta):
	if (debugMode):
		$RichTextLabel.text = str("FPS: ",  Engine.get_frames_per_second())
