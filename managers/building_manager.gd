extends Node





# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_debug_manager_debug_init_trigger(debugInit):
	$DebugInitNode.visible = debugInit


func _on_player_manager_select_building(building):
	#var selectedBuilding : Building = building
	#$DebugInitNode/Building
	pass # Replace with function body.
