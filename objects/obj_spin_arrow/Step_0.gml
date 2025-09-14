var player_x = obj_player.x;
var player_y = obj_player.y;


angle += rotation_speed;
if(angle>= 2*pi){angle =0;}

x= player_x + cos(angle)*radio;
y= player_y + sin(angle)*radio;
image_angle = (-(radtodeg(angle)))-90;