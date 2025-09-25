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
	
	sprite_index = sprites[Sprite_list.IDLES];
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
        if(xVel > 0) face = Sprite_list.DERECHA;
        if(xVel < 0) face = Sprite_list.IZQUIERDA;
    }
    if(xVel > 0 && face == Sprite_list.IZQUIERDA) face = Sprite_list.DERECHA;
    if(xVel < 0 && face == Sprite_list.DERECHA) face = Sprite_list.IZQUIERDA;
	sprite_index = sprites[face];
	
	check_wall_colision();
	
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
	//aca ta la wea pa nadar
	if (check_water_colision()) {
	    swim_buffer += 1;
	    if (swim_buffer >= 5) { 
			image_speed= 1;
			move_speed = 1;
	        state = playerState.SWIM;
	        swim_buffer = 0; 
	    }
	}else{
		    swim_buffer = 0; 
	}
	
}
	
function state_player_spin(){
	if(!instance_exists(obj_spin_arrow)){
        var arrow = instance_create_layer(x +(sprite_height/2) ,y,"UI", obj_spin_arrow); // Posición cerca del personaje
    
	}
	
	if(keyboard_check(vk_space)){
		state = playerState.JUMP;
		angle = obj_spin_arrow.spin_angle;
		if(instance_exists(obj_spin_arrow)){
			instance_destroy(obj_spin_arrow);
		}
	}
	
	if(keyboard_check(ord("C"))){
		state = playerState.WALK;
		if(instance_exists(obj_spin_arrow)){
			instance_destroy(obj_spin_arrow);
		}
	}
	sprite_index = sprites[Sprite_list.ACTION];
	
	
	
	
}

function state_player_jump(){
	if(jump_distance == 0){
		
		jump_distance = 64; //distancia total que se saltara
		jump_progress = 0; //distancia o progreso ya rrecorido
		jump_speed =  4; // velocidad del saltito
		
		if((angle>=pi/2)&&(angle<=(3*pi)/2)){
			//aca va la izquierda
			sprite_index = sprites[Sprite_list.JUMPL];
		}else{
			// y aca va la derecha
			sprite_index = sprites[Sprite_list.JUMPR];
		}
	
	}
	
	var move_x = cos(angle)*jump_speed;
	var move_y = sin(angle)*jump_speed;
	
	x+= move_x;
	y+= move_y;
	
	jump_progress += jump_speed;
	
	if(jump_progress >= jump_distance){
		jump_distance = 0;
		jump_progress = 0;
		state = playerState.IDLE;
	}
	
	
	
	
}

function state_player_swim(){
	//se movera pero mas lento y sin poder saltar ni poder estar en idle
	var tecla_derecha = keyboard_check(vk_right);
	var tecla_arriba = keyboard_check(vk_up);
	var tecla_abajo = keyboard_check(vk_down);
	var tecla_izquierda = keyboard_check(vk_left);
	
	
	face = Sprite_list.SWIM;
	//move_speed = extra_speed ? 2:1;
	xVel = (tecla_derecha - tecla_izquierda) * (move_speed/2);
    yVel = (tecla_abajo - tecla_arriba) * (move_speed/2);
	sprite_index = sprites[face];
	
	check_wall_colision();
	
	// aplicar movimiento
    x += xVel;
    y += yVel;

	
	if(check_water_colision()==false ){
		state = playerState.WALK;
		face = Sprite_list.DERECHA;
	}
}