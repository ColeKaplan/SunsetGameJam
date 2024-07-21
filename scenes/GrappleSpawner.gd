extends TileMap

var grapple = preload("res://scenes/Grapple.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawnGrapple(mousePosition):
	var localPosition = to_local(mousePosition)
	var tilePosition = self.local_to_map(localPosition)
	print(tilePosition)
	
	var spawnpoint = null
	if tilePosition.x <= 9 and tilePosition.x >= 7:
		spawnpoint = Vector2(8, tilePosition.y)
		
	if tilePosition.x <= 20 and tilePosition.x >= 18:
		spawnpoint = Vector2(19, tilePosition.y)
		
	if spawnpoint != null:
		var spawnpointLocal = self.map_to_local(spawnpoint)
		
		var grappleInstance = grapple.instantiate()
		grappleInstance.position = spawnpointLocal
		
		if tilePosition.x <= 20 and tilePosition.x >= 18:
			grappleInstance.scale.x = -1 * grappleInstance.scale.x
		
		add_child(grappleInstance)
		
#func spawnGrapple(mousePosition):
	#var maybeMousePosition = get_viewport().get_mouse_position()
	## To Fix!!!
	##	Locations are all wrong
	##	Should not be hardcoded by pixel, by tilemap x,y would be best cause that will scale
	#var localPosition = to_local(mousePosition)
	#var tilePosition = self.local_to_map(localPosition)
	#print("mouse:", mousePosition, "local: ", localPosition, "tile: ", tilePosition)
	#
	#var spawnpoint = null
	#if tilePosition.x <= 9:
		#spawnpoint = Vector2(8, tilePosition.y)
		#
	#if tilePosition.x >= 18:
		#spawnpoint = Vector2(19, tilePosition.y)
		#
	#if spawnpoint != null:
		#var spawnpointLocal = self.map_to_local(spawnpoint)
		#var spawnpointGlobal = self.to_global(spawnpointLocal)
		#
		#var grappleInstance = grapple.instantiate()
		#grappleInstance.position = maybeMousePosition
		#add_child(grappleInstance)
		#print("spawnTile:", spawnpoint, "spawnLocal: ", spawnpointLocal, "spawnGlobal: ", spawnpointGlobal)
