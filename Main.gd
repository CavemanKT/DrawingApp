extends Node2D

onready var SaveBtn = $SaveButton
onready var ClearBtn = $ClearButton
onready var FDialog = $FileDialog

var save = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$SpinBox.value = 10
	SaveBtn.connect('pressed', self, "_on_save_pressed")
	ClearBtn.connect("pressed", self, "_on_clear_pressed")
	FDialog.connect("confirmed", self, "_on_confirmed")
	FDialog.connect("visibility_changed", self, '_on_visibility_changed')
	
func _on_save_pressed():
	FDialog.show()
	
func _on_clear_pressed():
	for pencil in range(0, $ViewportContainer/Viewport/Canvas.get_child_count()):
		$ViewportContainer/Viewport/Canvas.get_child(pencil).queue_free()
		
	
	
func _on_confirmed():
	var img = $ViewportContainer/Viewport.get_texture().get_data()
	if FDialog.current_file.get_extension() == 'png' || 'jpg':
		img.convert(Image.FORMAT_RGBA8)
	img.flip_y()
	if FDialog.current_path == '':
		img.save_png('Users://')
	else: 
		img.save_png(FDialog.current_path)
		

func _on_visibility_change():
	save = !save
