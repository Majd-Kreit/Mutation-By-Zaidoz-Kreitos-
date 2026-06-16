extends CharacterBody2D
@onready var animate: AnimatedSprite2D = $AnimatedSprite2D
var HeartList : Array[TextureRect]
var Health = 4
const JUMP_VELOCITY = -250.0
var direction
var healthreduction = 0
func _ready() -> void:
	var HeartsParent = $CanvasLayer/HBoxContainer
	for child in HeartsParent.get_children():
		HeartList.append(child)
func UpdateHeartList():
	for i in range(HeartList.size()):
		HeartList[i].visible = (i < Health)
		healthreduction = i
func take_damage(amount):
	if amount > Health:
		z_index = 10
	if Health > 0:
		Health -= amount
	UpdateHeartList()

















func _physics_process(delta: float) -> void:
	var _left = Input.is_action_pressed("ui_left")
	var _right = Input.is_action_pressed("ui_right")
	if ScriptGlobal.WaterCount == 0:
		ScriptGlobal.OnWater = false

	Animation()

	if not is_on_floor():
		if ScriptGlobal.WaterCount == 0:
			velocity += get_gravity() * delta
		elif ScriptGlobal.WaterCount > 0:
			velocity += get_gravity() * delta * 0.0000001

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	elif ScriptGlobal.WaterCount > 0:
		if Input.is_action_pressed("ui_accept"):
			velocity.y = -20
		else:
			velocity.y = 20
		
	direction = Input.get_axis("ui_left", "ui_right")
	if !ScriptGlobal.OnWater:
		if direction:
			velocity.x = direction * ScriptGlobal.speed_x

		else:
			velocity.x = move_toward(velocity.x, 0, ScriptGlobal.speed_x )
	elif ScriptGlobal.OnWater:
		if direction:
			velocity.x = direction * ScriptGlobal.speed_x * 0.8
		else:
			velocity.x = move_toward(velocity.x, 0, (ScriptGlobal.speed_x * 0.8))
	move_and_slide()
#############################    CHANGE ANIMATION #############################
func Animation():
	if direction == 1:
		animate.flip_h = false
	elif direction == -1 :
		animate.flip_h = true
#####################   Hit Animation   #####################
	if healthreduction > Health:
		if animate.animation != "hit":
			animate.play("hit")
		healthreduction = -1

#####################  Normal Animation  #####################
	if !ScriptGlobal.inArea:
		if is_on_floor():
			if direction == 0:
				animate.play("idle")
			else:
				animate.play("walk")
		elif ScriptGlobal.WaterCount > 0:
			ScriptGlobal.OnWater = true
			if direction == 0:
				animate.play("swim idle")
			else:
				animate.play("swim")
		else:
			if animate.animation != "Jump":
				animate.play("Jump")
				
