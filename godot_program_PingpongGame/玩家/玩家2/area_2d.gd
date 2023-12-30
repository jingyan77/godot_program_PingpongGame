extends Area2D		#继承至Area2D即全局

signal abc

func _ready():
	var time = get_tree().create_timer(3)	#计时器对象time计时3秒，结束后会发出timeout的信号
	await time.timeout#里有timeout信号继续运行，否则暂停运行
	self.connect("abc",Callable(self,"a"))
	emit_signal("abc",1,2,3)
	
func a(b1,b2,b3):
	print(b1,b2,b3)
	
func _physics_process(delta):
	pass
	#for i in get_overlapping_areas():		#不断赋予区域内的实体
		#if i.is_in_group("Ball"):   #判断i中有无ball
			#get_node("sound").play()		#由主节点的脚本获取子节点
			#或者get_child(2).play()
			#i.vec.x=-5
	var y1 = Input.get_action_strength("玩家2上")*5	#输入映射函数——玩家1上，输出动作作用长度给y1
	var y2 = Input.get_action_strength("玩家2下")*5	#局部变量y1y2
	var y3 = position.y-y1+y2
	if y3>16 and y3<630:
		position.y=position.y-y1+y2#设置移动区域

#信号相当于引入了一个随时可用的功能函数
func on_area_enter(area):		#特殊接受外来信号的方法
	if area.is_in_group("Ball") :
		area.vec.x=-5			#函数检测有外来物体此即小球进入后函数激活里面信号发射
		$sound.play()
