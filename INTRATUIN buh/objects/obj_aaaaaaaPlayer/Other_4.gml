// Spawn furniture stored for this room
if (ds_map_exists(global.furniture_by_room, room)) {
    var list = global.furniture_by_room[? room];
    for (var i = 0; i < ds_list_size(list); i++) {
        var data = list[| i];
        instance_create_layer(data.x, data.y, "Instances", data.type);}}
