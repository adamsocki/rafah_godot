extends Node3D


signal castRayViaMouse(pos)
signal setSelectorPosition(pos)
signal releaseSelector()

#signal SelectBuilding(building)



var cameraRay : RayCast3D
var camera : Camera3D

var unitsUnderSelector = []
var isSelectorOverBuilding = false


# Called when the node enters the scene tree for the first time.
func _ready():
	cameraRay = $Camera3D/RayCast3D
	camera = $Camera3D
	#pass # Replace with function body.

var rayOrigin = Vector3()
var rayEnd = Vector3()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var spaceState = get_world_3d().direct_space_state
	var mousePosition = get_viewport().get_mouse_position()
	
	rayOrigin = camera.project_ray_origin((mousePosition))
	rayEnd = rayOrigin + camera.project_ray_normal(mousePosition) * 2000
	var query = PhysicsRayQueryParameters3D.create(rayOrigin, rayEnd)
	var intersection = spaceState.intersect_ray(query)

	if Input.is_action_pressed("mouse_left"):
		if intersection.has("position"):
			setSelectorPosition.emit(intersection["position"])

	if Input.is_action_just_released("mouse_left"):
		print(intersection["collider"].name)
		if intersection.has("collider"): 
			if intersection["collider"].name == "Building" :
				print("B")
				intersection["collider"].isBuildingSelected = true
				intersection["collider"].SelectBuilding()
				unitsUnderSelector.clear()
			else:
				isSelectorOverBuilding = false
		releaseSelector.emit() 

func _on_player_manager_updated_player_postion(newPosition):
	position += newPosition



func _on_selector_box_add_unit_to_selection(unit):
	unit.isUnderSelector = true
	unitsUnderSelector.append(unit)




func _on_selector_box_remove_unit_to_selection(unit):
	unit.isUnderSelector = false
	var unitIndex = unitsUnderSelector.find(unit)
	unitsUnderSelector.remove_at(unitIndex)
	
