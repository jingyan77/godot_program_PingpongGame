extends Node
#class_name 来创造新节点
class_name  GUIViewManager
#@export是来定义全局变量的引用
@export var viewConfigList: Array[GUIViewConfig] = []
#引入全局gui设置
@export var guiRoot:Node


var viewConfigMap := {}
var viewInstanceCount := 0
var viewInstanceMap := {}

func _ready() -> void:
	_build_view_config_map()

func _build_view_config_map():
	for config in viewConfigList:
		if config == null or config.id.is_empty():
			continue
		viewConfigMap[config.id] = config
		#print(viewConfigMap)

func _get_view_config(viewId:StringName) -> GUIViewConfig:
	return viewConfigMap[viewId]

#->int 说明新定义的函数的返回值为int
func _gen_new_view_instance_id() ->int:
	var t = viewInstanceCount
	viewInstanceCount +=1
	return t

func _get_view_instance(viewInstanceId:int) -> BaseGUIView:
	#print(viewInstanceMap[viewInstanceId])
	viewInstanceMap = viewConfigMap
	return viewInstanceMap[viewInstanceId]

#<以上为工具函数>
#以下为关键函数

func open_view(viewId:StringName):
	var config := _get_view_config(viewId)
	var viewInstanceId :=_gen_new_view_instance_id()
	var prefab:PackedScene = config.prefab
	var v = prefab.instantiate() as BaseGUIView
	v.config = config
	v.viewInstanceId = viewInstanceId
	viewConfigMap[viewInstanceId] = v
	guiRoot.add_child(v)
	v.open()
	return viewInstanceId

func close_view(viewInstanceId:int):
	var v := _get_view_instance(viewInstanceId)
	v.close()
	viewInstanceMap.erase(viewInstanceId)
	v.queue_free()#queue_free释放内存不会程序崩溃

