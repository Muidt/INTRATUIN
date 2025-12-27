// PLAYER STEP EVENT: MOVEMENT + WALL COLLISION + ROOM BOUNDARIES + CARRYING FURNITURE 

var move_speed = 5;

// TEMP VARIABLES
var new_x = x;
var new_y = y;


// VERTICAL MOVEMENT
if (keyboard_check(ord("W"))) {
    if (!collision_rectangle(
        x - sprite_width/2, y - sprite_height/2 - move_speed,
        x + sprite_width/2, y - sprite_height/2,
        wallobject, false, true))
    {new_y -= move_speed;}}

if (keyboard_check(ord("S"))) {
    if (!collision_rectangle(
        x - sprite_width/2, y + sprite_height/2,
        x + sprite_width/2, y + sprite_height/2 + move_speed,
        wallobject, false, true))
    {new_y += move_speed;}}


//HORIZONTAL MOVEMENT

if (keyboard_check(ord("A"))) {
    if (!collision_rectangle(
        x - sprite_width/2 - move_speed, y - sprite_height/2,
        x - sprite_width/2, y + sprite_height/2,
        wallobject, false, true))
    {new_x -= move_speed;}}

if (keyboard_check(ord("D"))) {
    if (!collision_rectangle(
        x + sprite_width/2, y - sprite_height/2,
        x + sprite_width/2 + move_speed, y + sprite_height/2,
        wallobject, false, true))
    {new_x += move_speed;}}


//APPLY MOVEMENT
x = new_x;
y = new_y;

//CLAMP TO ROOM BOUNDARIES 
x = clamp(x, sprite_width/2, room_width - sprite_width/2);
y = clamp(y, sprite_height/2, room_height - sprite_height/2);


//MOVE CARRIED FURNITURE
if (carrying_item_instance != noone && instance_exists(carrying_item_instance)) {
    var carry_offset_x = -sprite_width/4;  
    var carry_offset_y = sprite_height/8;  

    carrying_item_instance.x = x + carry_offset_x;
    carrying_item_instance.y = y + carry_offset_y;
	
} else {carrying_item_instance = noone;
		carrying_item = noone;}













// shop menu controls code
if (global.shop_open) {
    if (keyboard_check_pressed(ord("Z"))) {
        global.shop_selected = max(0, global.shop_selected - 1);}
	
	if (keyboard_check_pressed(ord("X"))) {
        global.shop_selected = min(
            array_length(global.shop_items) - 1,
            global.shop_selected + 1);}

	if (keyboard_check_pressed(vk_enter)) 
		{if (carrying_item_instance == noone) 
			{var item = global.shop_items[global.shop_selected].obj;

            carrying_item = item;
            carrying_item_instance = instance_create_layer(x, y, "Instances", item);

            show_debug_message("Bought and picked up item!");}
			
        global.shop_open = false;}

    if (keyboard_check_pressed(vk_escape))
		{global.shop_open = false;}}
