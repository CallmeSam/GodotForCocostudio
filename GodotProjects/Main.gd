extends Control

onready var tree = $MainHSplit/LeftContent/Content
onready var canvas = $MainHSplit/Canvas
enum NodeType {Node, Sprite}
var curType = null
var nodeSelected = null
var itemSelected: TreeItem
var nodeIndex = 0

var tex = preload("res://icon.png")
var originName : String
# Called when the node enters the scene tree for the first time.
func _ready():
	var item = tree.create_item()
	item.set_text(0, "Panel")
	itemSelected = item
	nodeSelected = canvas.get_node("Panel")

func _on_Node_button_down():
	curType = NodeType.Node
	

func _on_Node_button_up():
	var panel = canvas.get_node("Panel")
	var pos = panel.get_local_mouse_position()
	if panel.get_rect().has_point(pos):
		var node = ColorRect.new()
		nodeSelected.add_child(node)
		node.set_size(Vector2(10, 10))
		node.set_frame_color(Color(1, 1, 1, 1))
		node.set_position(pos)
		node.name = 'Node_%d' % nodeIndex
		nodeIndex = nodeIndex + 1
		
		var item = tree.create_item(itemSelected)
		item.set_text(0, node.name)
	
	curType = null
	pass # Replace with function body.

func _on_Content_cell_selected():
	var item = tree.get_selected()
	itemSelected = item
	nodeSelected = getSelectedNode()

func _on_Content_item_activated():
	itemSelected.set_editable(0, true)

func _on_Content_item_edited():
	var curText = itemSelected.get_text(0)
	nodeSelected.name = curText	
	
func getSelectedNode():
	if itemSelected:
		var path = getPathFromSelectedItem(itemSelected, "")
		return canvas.get_node(path)
		
func getPathFromSelectedItem(item, path):
	if path.empty() :
		path = item.get_text(0)
	else:
		path = "%s/%s" % [item.get_text(0), path]
		
	if item.get_parent() :
		return getPathFromSelectedItem(item.get_parent(), path)
	else:
		return path
