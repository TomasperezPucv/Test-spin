function state_player_idle(){
	xVel = 0;
	yVel = 0;
	idle_timer =0;
	var tecla_derecha = keyboard_check(vk_right);
	var tecla_arriba = keyboard_check(vk_up);
	var tecla_abajo = keyboard_check(vk_down);
	var tecla_izquierda = keyboard_check(vk_left);
	
	if((tecla_derecha)||(tecla_arriba)||(tecla_izquierda)||(tecla_abajo)){
		state = playerState.WALK;
	}
	
	if(keyboard_check(ord("Z"))){
		state = playerState.SPIN;
	}
	
	sprite_index = sprites[IDLES];
	image_index =0;
}

function state_player_walk(){
	
	
	var tecla_derecha = keyboard_check(vk_right);
	var tecla_arriba = keyboard_check(vk_up);
	var tecla_abajo = keyboard_check(vk_down);
	var tecla_izquierda = keyboard_check(vk_left);
	var extra_speed= keyboard_check(ord("X"));
	
	if(extra_speed){
		image_speed= 2;
		move_speed = 2;
	}else{
		image_speed= 1;
		move_speed = 1;
	}
	
	//move_speed = extra_speed ? 2:1;
	xVel = (tecla_derecha - tecla_izquierda) * move_speed;
    yVel = (tecla_abajo - tecla_arriba) * move_speed;
	 // actualizar dirección (face)
    if(yVel == 0){
        if(xVel > 0) face = DERECHA;
        if(xVel < 0) face = IZQUIERDA;
    }
    if(xVel > 0 && face == IZQUIERDA) face = DERECHA;
    if(xVel < 0 && face == DERECHA) face = IZQUIERDA;
	sprite_index = sprites[face];
	
	// aplicar movimiento
    x += xVel;
    y += yVel;
	
	
    // manejar inactividad
    if(xVel == 0 && yVel == 0) {
        idle_timer += delta_time / 1000000; // delta_time → microsegundos → lo pasamos a segundos
        image_index = 0
		if(idle_timer >= 5) { // 10 segundos exactos
            state = playerState.IDLE;
            idle_timer = 0;
        }
    } else {
        idle_timer = 0; // reset si se mueve
    }
	//Manejar la habilidad de Spin
	if(keyboard_check(ord("Z"))){
		state = playerState.SPIN;
	}
	
}
	
function state_player_spin(){
	if(!instance_exists(obj_spin_arrow)){
        var arrow = instance_create_layer(x +(sprite_height/2) ,y,"UI", obj_spin_arrow); // Posición cerca del personaje
    
	}
	
	if(keyboard_check(ord("C"))){
		state = playerState.WALK;
		if(instance_exists(obj_spin_arrow)){
			instance_destroy(obj_spin_arrow);
		}
	}
	sprite_index = sprites[ACTION]
	
	
	
	
}

function state_player_jump(){
	
}