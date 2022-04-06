extends Node2D



func _process(delta):
	var pencil  = preload("res://Pencil.tscn").instance()
	var parent = get_parent().get_parent().get_parent()
	if Input.is_action_just_pressed("Draw"):
		pencil.default_color = parent.get_node("ColorPicker").color
		pencil.width = parent.get_node('SpinBox').value
		if parent.save == false:
			add_child(pencil)
			
		
