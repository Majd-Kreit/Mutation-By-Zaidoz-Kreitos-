extends AnimatableBody2D
@onready var left: RayCast2D = $left
@onready var right: RayCast2D = $right
@onready var down_right: RayCast2D = $down_right
@onready var down_left: RayCast2D = $down_left
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var speed = 50

func _physics_process(delta: float) -> void:
	position.x += speed * delta  *0
	if left.is_colliding() or !down_left.is_colliding():
		speed = 50
		animated_sprite_2d.flip_h = true
	elif right.is_colliding() or !down_right.is_colliding():
		speed = -50
		animated_sprite_2d.flip_h  = false
