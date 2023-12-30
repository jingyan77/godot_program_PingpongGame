extends Area2D

var vec:Vector2=Vector2(5,5)		#定义了一个变量vec为指向命令，x，y比例越大移动越快
var init_position
# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_to_group("Ball")
	init_position=position			#调用初始化ready
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):					#为过程中不断刷新帧
	#position=position+Vector2(1,0)		#vector为指向的意思,朝1，0方向移动
	position=position+vec
	

func rset():							#定义一个重开始函数
	if vec.x>0:
		CountScroe.score1=CountScroe.score1 + 1
	else:
		CountScroe.score2=CountScroe.score2 + 1
		
	position=init_position
