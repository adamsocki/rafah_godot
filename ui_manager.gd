extends Node


var isDrawing = false
var startingBoxPosition : Vector2
var selectionRectangle : Node2D

var selectionRectangleSize : Vector2
var selectionRectanglePosition : Vector2

# Called when the node enters the scene tree for the first time.
func InitUIManager():
	$SelectionRectangle.InitSelectionRectangle()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func UpdateUIManager_Logic(delta):
	$SelectionRectangle.UpdateSelectionRectangle_Logic(delta)




func _on_debug_manager_gui_trigger(showGui):
	$InGameUI.visible = showGui
