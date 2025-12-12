var px = x;
var py = y;

// --- DROP ---
if (carrying_item_instance != noone && instance_exists(carrying_item_instance)) {

    // ensure room list exists
    if (!ds_map_exists(global.furniture_by_room, room)) {
        global.furniture_by_room[? room] = ds_list_create();
    }

    var room_list = global.furniture_by_room[? room];

    // save furniture info
    var item_data = {type: carrying_item, x: carrying_item_instance.x, y: carrying_item_instance.y};
    ds_list_add(room_list, item_data);

    // stop carrying
    carrying_item_instance = noone;
    carrying_item = noone;

    show_debug_message("Dropped furniture!");

}

// --- PICKUP ---
else {

    // Find nearest furniture within pickup radius
    var nearest = noone;
    var nearest_dist = 32; // pixels

    with (obj_carriable_item_parent) {
        var dist = point_distance(x, y, px, py);
        if (dist < nearest_dist) {
            nearest = id;
            nearest_dist = dist;
        }
    }

    if (nearest != noone) {
        carrying_item = nearest.object_index;
        carrying_item_instance = instance_create_layer(nearest.x, nearest.y, "Instances", carrying_item);
        instance_destroy(nearest);
        show_debug_message("Picked up furniture!");
    }

}
