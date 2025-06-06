extends CharacterBody2D

const playerSpeed = 250
const playerAccel= 2.0

var input: Vector2

func get_input():
	input.x = Input.get_action_strength("right_move") - Input.get_action_strength("left_move")
	input.y = Input.get_action_strength("down_move") - Input.get_action_strength("up_move")
	return input.normalized()
	
func _process(delta):
	var playerInput = get_input()
	
	velocity = lerp(velocity, playerInput * playerSpeed, delta * playerAccel)
	
	move_and_slide()
	
	
