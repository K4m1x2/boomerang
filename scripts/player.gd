extends CharacterBody2D

@export var speed: float = 200.0
@export var stop_distance: float = 5.0

var mouse_pressionado: bool = false

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		mouse_pressionado = event.pressed  # true quando pressiona, false quando solta

func _physics_process(delta):
	if mouse_pressionado:
		var destino = get_global_mouse_position()
		var direcao = destino - global_position

		if direcao.length() > stop_distance:
			velocity = direcao.normalized() * speed
		else:
			velocity = Vector2.ZERO
	else:
		velocity = Vector2.ZERO

	move_and_slide()
