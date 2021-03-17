extends Control

onready var tree = $MainHSplit/LeftContent/Content
onready var panel = $MainHSplit/RightContent/Panel
enum NodeType {Node, Sprite}
var nodeIndex = 0

var tex = preload("res://icon.png")
var originName : String
# Called when the node enters the scene tree for the first time.
func _ready():
	tree.select_mode = Tree.SELECT_MULTI
	var item = tree.create_item()
	item.set_text(0, "Panel")
	item.set_editable(0, true)
	item.set_metadata(0, panel.get_path())

func _on_Node_button_up():
	var select = tree.get_selected()
	if not select:
		return
	
	
	var pos = panel.get_local_mouse_position()
	if panel.get_rect().has_point(pos):
		var parent = get_node(select.get_metadata(0))
		var node = ColorRect.new()
		node.set_size(Vector2(10, 10))
		node.set_frame_color(Color(1, 1, 1, 1))
		node.set_position(parent.get_local_mouse_position())
		parent.add_child(node)
		node.name = 'Node_%d' % nodeIndex
		nodeIndex = nodeIndex + 1
		
		var item = tree.create_item(select)
		item.set_text(0, node.name)
		item.set_metadata(0, node.get_path())
		item.set_editable(0, true)

func _on_Content_item_edited():
	var select = tree.get_selected()
	var curText = select.get_text(0)
	var node = get_node(select.get_metadata(0))
	node.name = curText	
	
func _on_Content_nothing_selected():
	var select = tree.get_selected()
	if select:
		var column = tree.get_selected_column()
		select.deselect(0)
