extends Area2D

@export var y = 5		#加export可以在父节点的检查器中直接修改
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):#一直刷新
	pass
func _physics_process(delta):		#在有物理碰撞时保持刷新
	for i in get_overlapping_areas():		#不断赋予区域内的实体
		if i.is_in_group("Ball"):   #判断i中有无ball
			i.vec.y=y
