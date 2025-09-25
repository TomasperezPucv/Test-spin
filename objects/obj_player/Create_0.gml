
//velocidades x e y
xVel = 0;
yVel = 0;

//velocidad de movimiento
move_speed = 1;
//ARREGLO que guardara los prites de cada direccion segun las macros en el script
sprites[Sprite_list.DERECHA] = spr_player_walk_right
sprites[Sprite_list.IZQUIERDA] = spr_player_walk_left;
sprites[Sprite_list.ACTION] =  spr_player_preparing;
sprites[Sprite_list.IDLES] = spr_player_impatient;
sprites[Sprite_list.JUMPR] = spr_player_jumping_right;
sprites[Sprite_list.JUMPL] = spr_player_jumping_left;
sprites[Sprite_list.SWIM] = spr_player_water;

angle = 0;
state = playerState.IDLE;
face = Sprite_list.DERECHA
idle_timer = 0;
spin_arrow = noone;

jump_distance =0;
jump_progress =0;
jump_speed = 0;
swim_buffer=0;
