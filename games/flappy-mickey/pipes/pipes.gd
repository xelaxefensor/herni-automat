extends Node2D

#Script pro nastavení rng posunu trubek a jejich pohyb

@export var move_amount : float = 2			 # Počet pixelů o který se trubka posune za 1 tick
@export var randomize_amount : float = 2	 # Počet rng posunu v pixelech

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	position.y += rng.randf_range(-randomize_amount, randomize_amount) 
	#Při přidání objektu do scény(_ready funkce), ho následně posuneme na souřadnici y o rng číslo
	

# Volá se každý fyzický tick enginu(v základu nastaven na 60 ticků za sekundu)
func _physics_process(delta: float) -> void:
	translate(Vector2(-move_amount * delta, 0))
	# Posune nodu o move_amount doleva, musíme vynásobit deltou kvůli nestabilitě frameratu
	# Promněná delta udává čas,který uplynul od předchozího snímku


func _on_score_zone_body_exited(body: Node2D) -> void:
	if body is RigidBody2D:
		body.pipe_cleared.emit()
	# Pokud hráč(neboli těleso typu RigidBody2D, jelikož žádné jiné těleso Rigidody2D ve hře není), exitne zónu která určije projetí trubky,
	# tak na hráči vyvolá signál pipe_cleared
