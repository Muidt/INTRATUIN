// Basic shop menu
if (global.shop_open) {

    var xx = 50;
    var yy = 50;

    draw_set_color(c_black);
    draw_rectangle(xx - 10, yy - 10, xx + 200, yy + 240, false);

    for (var i = 0; i < array_length(global.shop_items); i++) {
        var txt = global.shop_items[i].name;

        if (i == global.shop_selected)
            draw_set_color(c_yellow);
        else
            draw_set_color(c_white);

        draw_text(xx, yy + i * 24, txt);}}
