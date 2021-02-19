extends VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_tree_button_press(btn):
	var root = get_node('/root/Control')
	root.changeFocusBtn(btn)
	print(root)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
