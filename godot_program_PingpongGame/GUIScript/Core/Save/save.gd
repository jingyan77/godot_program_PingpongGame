extends Node


func save(id):
	var packed_scene = PackedScene.new()
	packed_scene.pack(get_tree().get_current_scene())
	ResourceSaver.save("res://save"+str(id)+".tscn",packed_scene)
	
