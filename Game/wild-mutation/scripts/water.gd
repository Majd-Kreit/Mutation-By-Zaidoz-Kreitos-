extends Area2D




func _on_body_entered(_body: Node2D) -> void:
	ScriptGlobal.WaterCount += 1




func _on_body_exited(_body: Node2D) -> void:
	ScriptGlobal.WaterCount -= 1
