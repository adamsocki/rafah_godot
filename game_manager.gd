extends Node



var playerManager : Node
var uiManagerManager : Node
var debugManager : Node

func _ready():
	
	playerManager = get_node("PlayerManager")
	uiManagerManager = get_node("UIManager")
	debugManager = get_node("DebugManager")
	
	playerManager.InitPlayerManager()
	uiManagerManager.InitUIManager()
	debugManager.InitDebugManager()



func _process(delta):
	
	# LOGIC
	playerManager.UpdatePlayerManager(delta)
	uiManagerManager.UpdateUIManager_Logic(delta)
	
	# RENDER
	debugManager.UpdateDebugManager(delta)
