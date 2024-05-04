extends Node3D


signal castRayViaMouse(position)
signal setSelectorPosition(position)
signal releaseSelector()



var cameraRay : RayCast3D
var camera : Camera3D

var unitsUnderSelector = []


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
	
