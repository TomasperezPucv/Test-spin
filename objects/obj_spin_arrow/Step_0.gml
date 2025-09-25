var player_x = obj_player.x;
var player_y = obj_player.y;


spin_angle  += rotation_speed;
if(spin_angle >= 2*pi){spin_angle  =0;}

x= player_x + cos(spin_angle )*radio;
y= player_y + sin(spin_angle )*radio;
image_angle = (-(radtodeg(spin_angle )))-90;