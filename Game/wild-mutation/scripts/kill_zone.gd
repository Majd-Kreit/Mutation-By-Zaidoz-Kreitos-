extends Area2D
@onready var timer = $Timer

func _on_body_entered(_body):
	
	Engine.time_scale = 0.5
	timer.start()
	ScriptGlobal.speed_x = 0


func _on_timer_timeout():
	ScriptGlobal.speed_x = 120
	Engine.time_scale = 1
	get_tree().reload_current_scene()
