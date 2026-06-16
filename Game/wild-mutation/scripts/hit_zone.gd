extends Area2D
var CanDamage = true
@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = $"../../Player"


func _physics_process(_delta: float) -> void:
	if ScriptGlobal.inArea && CanDamage:
		player.take_damage(1)
		CanDamage = false
		timer.start()


 
func _on_body_entered(_body: Node2D) -> void:
	ScriptGlobal.inArea = true
func _on_body_exited(_body: Node2D) -> void:
	ScriptGlobal.inArea = false

func _on_timer_timeout() -> void:
	CanDamage = true
