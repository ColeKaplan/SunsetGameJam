extends Node2D

var grapple = preload("res://scenes/Grapple.tscn")
var tileMap
# Called when the node enters the scene tree for the first time.
func _ready():
	tileMap = get_node("TileMap") # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			tileMap.spawnGrapple(get_global_mouse_position())
			#spawnGrapple(get_global_mouse_position())
	
func spawnGrapple(mousePosition):
	# To Fix!!!
	#	Locations are all wrong
	#	Should not be hardcoded by pixel, by tilemap x,y would be best cause that will scale
	
	var grappleInstance = grapple.instantiate()
	grappleInstance.position = mousePosition
	add_child(grappleInstance)
	
