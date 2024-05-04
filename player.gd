extends Node3D


signal castRayViaMouse(position)
signal setSelectorPosition(position)
signal releaseSelector()

var cameraRay : RayCast3D
var camera : Camera3D

# Called when the node enters the scene tree for the first time.
func _ready():
	cameraRay = $Camera3D/RayCast3D
	camera = $Camera3D
	#pass # Replace with function body.


var rayOrigin = Vector3()
var rayEnd = Vector3()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print("camera Pos")
	#print(camera.position)
	#var mousePos = get_viewport().get_mouse_position()
	#print ("mouse pos:")
	#print(mousePos)
	#var pos = camera.project_ray_origin(mousePos)
	#print("project Pos:")
	#print (pos)
	#
	#var nor = camera.project_ray_normal(mousePos)
	#print("normal Pos:")
	#print (nor)
	#
	#cameraRay.target_position = pos + nor * 2000
	#print(cameraRay.target_position)
	#print(cameraRay.get_collider())
	
	#cameraRay.position = 
	#var camera = get_tree().root.get_camera_3d()
	var spaceState = get_world_3d().direct_space_state
	var mousePosition = get_viewport().get_mouse_position()
	
	rayOrigin = camera.project_ray_origin((mousePosition))
	rayEnd = rayOrigin + camera.project_ray_normal(mousePosition) * 2000
	var query = PhysicsRayQueryParameters3D.create(rayOrigin, rayEnd)
	var intersection = spaceState.intersect_ray(query)
	#print(intersection)
	#var rayResults = get_world_3d().direct_space_state.intersect_shape(query)
	
	if Input.is_action_pressed("mouse_left"):
		var i = 0
		#print("Count 1")
		#print(i)
		if intersection.has("position"):
			#print(intersection["position"])
			setSelectorPosition.emit(intersection["position"])
			
		#if intersection.has("collider"):
			#pass
			#print(intersection["collider"])
			#print(intersection["collider"].name)
			#setSelectorPosition
		#for result in intersection:
			#i += 1
			
	
		
		#print(rayResults["collider"])
		#if (rayResults["collider"] == ):
	if Input.is_action_just_released("mouse_left"):
		releaseSelector.emit()
	
	

	
	
	#var mouse_pos = get_viewport().get_mouse_position()
	#var ray = get_world_3d().direct_space_state.intersect_ray(get_global_transform().origin,get_global_transform().origin + (get_viewport().get_camera().unproject(mouse_pos) - get_global_transform().origin).normalized() * 1000)
	#if ray:
		#var floor_position = ray.position
		#var floor_normal = ray.normal
		 ##Do something with the floor position and normal


#func _physics_process(delta):
	#var spaceState = get_world_3d().direct_space_state
	#
	#var mousePos = get_viewport().get_mouse_position()
	##print(mousePos)
	#var camera = get_tree().root.get_camera_3d()
	#print(camera.position)
	#var cameraRayOrigin = camera.project_ray_origin(mousePos)
	#var cameraRayEnd = cameraRayOrigin + camera.project_ray_normal(mousePos) * 100
	#var p : PhysicsRayQueryParameters3D  = PhysicsRayQueryParameters3D.new()
	#p.create(cameraRayOrigin, cameraRayEnd)
	##var collision = spaceState.intersect_ray(p)
	#
	##Returns a new, pre-configured PhysicsRayQueryParameters3D object. Use it to quickly create query parameters using the most common options.
#
	#var query = PhysicsRayQueryParameters3D.create(camera.position, camera.position + Vector3(0, -1000, 0))
	#var collision = get_world_3d().direct_space_state.intersect_ray(query)
#
	#for i in range(collision.size()):
		#var key = collision.keys()[i]
		#var value = collision[key]
		#print(value)
		#if collision.has("position"):
			##print("col:")
			#print(collision["position"])
	
	





func _on_player_manager_updated_player_postion(newPosition):
	print(newPosition)
	position += newPosition
