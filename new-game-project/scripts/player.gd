extends CharacterBody2D

@export var speed: float = 250.0
@export var jump_velocity: float = -450.0

func _physics_process(delta: float) -> void:
	# Tambahkan gravitasi jika player tidak menyentuh lantai
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Input kiri dan kanan
	var direction := Input.get_axis("ui_left", "ui_right")

	# Gerakan horizontal
	velocity.x = direction * speed

	# Lompat
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	# Jalankan pergerakan
	move_and_slide()
