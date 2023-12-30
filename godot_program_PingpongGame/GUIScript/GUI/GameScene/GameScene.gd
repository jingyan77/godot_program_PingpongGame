extends BaseGUIView

func _on_end_button_pressed():
	G.get_gui_view_manager().open_view("StartMenu")
	close_self()
	#queue_free()
