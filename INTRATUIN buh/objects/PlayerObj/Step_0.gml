var move_speed = 5;




/// UP
if (keyboard_check(ord("W"))) {
    if (!place_meeting(x, y - move_speed, wallobject)) {
        y -= move_speed;
    }
}

/// DOWN
if (keyboard_check(ord("S"))) {
    if (!place_meeting(x, y + move_speed, wallobject)) {
        y += move_speed;
    }
}

/// LEFT
if (keyboard_check(ord("A"))) {
    if (!place_meeting(x - move_speed, y, wallobject)) {
        x -= move_speed;
    }
}

/// RIGHT
if (keyboard_check(ord("D"))) {
    if (!place_meeting(x + move_speed, y, wallobject)) {
        x += move_speed;
    }
}

// Move carried furniture with the player
if (carrying_item_instance != noone && instance_exists(carrying_item_instance)) {
    carrying_item_instance.x = x;
    carrying_item_instance.y = y;
} else {
    carrying_item_instance = noone;
    carrying_item = noone;
}
