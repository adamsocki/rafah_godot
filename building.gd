extends Node3D
 
var isBuildingSelected = false

var baseMat = preload("res://materials/base_mat_building.tres")
var selectedMat = preload("res://materials/selected_mat_building.tres")

var mesh : MeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready(): 
	mesh = $CollisionShape3D/MeshInstance3D
	mesh.set_surface_override_material(0, baseMat)
	
func SelectBuilding():
	isBuildingSelected = true
	mesh.set_surface_override_material(0, selectedMat)
	
	
func DeSelectBuilding():
	isBuildingSelected = false
	mesh.set_surface_override_material(0, baseMat)
	
	#"surface_material_override/0"  = 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
