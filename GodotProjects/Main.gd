extends Control

enum NodeType {Node, Sprite}
var curType = null
var nodeSelected = null
var nodeIndex = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	nodeSelected = $MainHSplit/LeftContent/NodeTree/Content/Panel

func _on_Node_button_down():
	curType = NodeType.Node

func _on_Node_button_up():
	var canvas = $MainHSplit/RightContent/ColorRect
	var pos = canvas.get_local_mouse_position()
	if canvas.get_rect().has_point(pos):
		var node = ColorRect.new()
		canvas.add_child(node)
		node.set_size(Vector2(10, 10))
		node.set_frame_color(Color(1, 1, 1, 1))
		node.set_position(pos)
		node.name = 'Node_%d' % nodeIndex
		nodeIndex = nodeIndex + 1
		
		var btn = Button.new()
		btn.text = node.name
		btn.connect('pressed', $MainHSplit/LeftContent/NodeTree/Content, '_on_tree_button_press', [btn])
		$MainHSplit/LeftContent/NodeTree/Content.add_child(btn)
		btn.position = 
	
	curType = null
	pass # Replace with function body.

# external

func changeFocusBtn(btn):
	nodeSelected = btn
