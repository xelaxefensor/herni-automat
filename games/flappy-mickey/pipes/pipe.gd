extends RigidBody2D

var move_amount : float = 20

static var id_set = 0
var id = 0


func _ready() -> void:
	id = id_set
	id_set+=1
	

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	position.x -= move_amount * state.step
	

func _process(delta: float) -> void:
	if id == 0:
			print("pipe: "+ str(global_position.x) + "              sprite: "+ str($"../Sprite2D".global_position.x))
			$"../Sprite2D".global_position.x = lerp($"../Sprite2D".global_position.x, global_position.x, 0.1)

	
