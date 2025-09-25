var controls_text = "";
var angrytext = false;
//ver el estado del playehreskhrekuwh
switch(obj_player.state){
	case playerState.IDLE:
		controls_text = "hace algo porfa me aburro";
		break;
	case playerState.WALK:
		controls_text = "[Arrows]: Move\n[X]: Run\n[Z]: Spin Jump";
		break;
	
	case playerState.SPIN:
		controls_text = "[C]: Cancel\n[Space]: Jump";
        break;
	
	case playerState.SWIM:
		controls_text = "[Arrows]: Swim";
        break;
		
	default:
        controls_text = "como chucha llegamos hasta aca XD"; // por si acaso
        break;
}

if(obj_player.state = playerState.IDLE){
	angrytext = true;
}else{angrytext = false;}

draw_set_font(fnt_control);

if(angrytext == true){
	draw_set_color(c_red);
}else{draw_set_color(c_white);}

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

draw_text(camera_get_view_border_x(0),display_get_gui_height()-16,controls_text);