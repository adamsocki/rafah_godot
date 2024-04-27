extends Node


@export_group("Debug Properties")
@export var debugMode: bool




func _process(delta):
	if (debugMode):
		$RichTextLabel.text = str("FPS: ",  Engine.get_frames_per_second())
