extends Node

class_name BaseGUIView
#config表示界面配置
var config:GUIViewConfig
#打开的界面的实例Id
var viewInstanceId = -1

func _open():
	pass

func _close():
	pass
	
func open():
	#其他处理
	_open()
	
func close():
	_close()
	
func close_self():
	#print(viewInstanceId)
	G.get_gui_view_manager().close_view(viewInstanceId)
	


