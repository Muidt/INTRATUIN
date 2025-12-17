if (global.shop_open) exit; 

var px = x;
var py = y;

// DROP 
if (carrying_item_instance != noone && instance_exists(carrying_item_instance)) {
    if (!ds_map_exists(global.furniture_by_room, room)) {
        global.furniture_by_room[? room] = ds_list_create();}

    var room_list = global.furniture_by_room[? room];
    var item_data = {type: carrying_item, x: carrying_item_instance.x, y: carrying_item_instance.y};
    ds_list_add(room_list, item_data);
    carrying_item_instance = noone;
    carrying_item = noone;

    show_debug_message("Dropped furniture!");}

// PICKUP 
else {

    var nearest = noone;
    var nearest_dist = 32;

    with (obj_carriable_item_parent) {
        var dist = point_distance(x, y, px, py);
        if (dist < nearest_dist) {
            nearest = id;
            nearest_dist = dist;}}

    if (nearest != noone) {
        carrying_item = nearest.object_index;
        carrying_item_instance = instance_create_layer(nearest.x, nearest.y, "Instances", carrying_item);
        instance_destroy(nearest);
        show_debug_message("Picked up furniture!");}}


if (place_meeting(x, y, Obj_shop)) {
    global.shop_open = true;}
