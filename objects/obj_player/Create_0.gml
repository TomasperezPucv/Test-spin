
//velocidades x e y
xVel = 0;
yVel = 0;

//velocidad de movimiento
move_speed = 1;
//ARREGLO que guardara los prites de cada direccion segun las macros en el script
sprites[DERECHA] = spr_player_walk_right
sprites[IZQUIERDA] = spr_player_walk_left;
sprites[ACTION] =  spr_player_preparing;
sprites[IDLES] = spr_player_impatient;
angle = 0;
state = playerState.IDLE;
face = DERECHA
idle_timer = 0;
spin_arrow = noone;
