extends Tree


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_drag_forwarding(self)
	pass # Replace with function body.

func get_drag_data_fw(position, fromControl):
	var select = self.get_selected()
	var label = Label.new()
	label.set_text(select.get_text(0))
	self.set_drag_preview(label)
	
	return true

func can_drop_data_fw(point, data, contrl):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
