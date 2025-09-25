switch(state){
	case playerState.IDLE:
		state_player_idle();
		break;
	case playerState.WALK:
		state_player_walk();
		break;
	case playerState.SPIN:
		state_player_spin();
		break;
	case playerState.JUMP:
		state_player_jump();
		break;
	case playerState.SWIM:
		state_player_swim();
		break;
		
}