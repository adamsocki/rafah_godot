extends MeshInstance3D

var isSelecting = false
var startingPosition = Vector3.ZERO

signal AddUnitToSelection(unit)
signal RemoveUnitToSelection(unit)

#signal DeselectBuilding

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	pass

func _on_player_set_selector_position(updatedPosition):
	if (!isSelecting):
		startingPosition = updatedPosition
		startingPosition.y = updatedPosition.y + 1
		isSelecting = true
	else:
		scale.x = updatedPosition.x - startingPosition.x
		scale.z = updatedPosition.z - startingPosition.z
	
	position = startingPosition + scale / 2

func _on_player_release_selector():
	isSelecting = false


func _on_area_3d_body_entered(body):
	print(body)
	if body.name == "Unit":
		RemoveUnitToSelection.emit(body)
		print("HIT")
	
func _on_area_3d_body_exited(body):
	print(body)
	if body.name == "Unit":
		AddUnitToSelection.emit(body)
		print("Out")
