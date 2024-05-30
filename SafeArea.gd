extends MarginContainer

var usable = null
var saveAreaRect = null
var margin_value = null
@export var additionalSpace:int
@export var safeAreaColor:Color
@export var BarLayer:CanvasLayer
var saveAreaSize:int


# Called when the node enters the scene tree for the first time.
func _ready():
	usable = DisplayServer.get_display_safe_area()
	var full = DisplayServer.screen_get_size().y
	saveAreaSize = full - usable.size.y
	saveAreaRect = Rect2(0, 0, usable.size.x, saveAreaSize + additionalSpace)
	moveCanvasLayer()
	
	
	
	print("Usable: %s ; Full Y: %s" % [usable, full])
	print("X: %s Y: %s" % [usable.position.x, usable.position.y])
	print("SaveAreaSize: %spx" % saveAreaSize)
	print(saveAreaRect)
	
	margin_value = saveAreaSize + additionalSpace
	
	add_theme_constant_override("margin_top", margin_value)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()
	pass
	
func _draw():
	draw_rect(saveAreaRect, safeAreaColor)
	set_as_top_level(true)
	pass
	
func moveCanvasLayer():
	if BarLayer != null:
		BarLayer.offset = Vector2(0, saveAreaSize + additionalSpace)
	pass
