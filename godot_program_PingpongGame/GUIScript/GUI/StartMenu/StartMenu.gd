extends BaseGUIView


func _open():
	pass

func _close():
	pass


func _on_quit_button_pressed():
	get_tree().quit()

func _on_settings_button_pressed():
	G.get_gui_view_manager().open_view("SettingsMenu")
	#GUIViewManager.open_view("SettingsMenu")

func _on_other_button_pressed():
	G.get_gui_view_manager().open_view("OtherMenu")


func _on_start_button_pressed():
	G.get_gui_view_manager().open_view("GameScene")
