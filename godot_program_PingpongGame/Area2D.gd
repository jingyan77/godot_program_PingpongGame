extends Area2D


func _physics_process(delta):
	for i in get_overlapping_areas():		#不断赋予区域内的实体
		if i.is_in_group("Ball"):   #判断i中有无ball
			$sound.play()			#直接调用子节点sound
			i.vec.x=5
	var y1 = Input.get_action_strength("玩家1上")*5	#输入映射函数——玩家1上，输出动作作用长度给y1
	var y2 = Input.get_action_strength("玩家1下")*5
	var y3 = position.y-y1+y2
	if y3>16 and y3<630:
		position.y=position.y-y1+y2#设置移动区域
