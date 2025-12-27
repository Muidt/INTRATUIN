// Global map to store furniture positions per room
global.furniture_by_room = ds_map_create();

global.shop_items = [
    {name: "Chair",  obj: obj_chair},
    {name: "Table",  obj: obj_table},
    {name: "Lamp",   obj: obj_lamp},
	{name: "Wardrobe", obj: obj_wardrobe},
	{name: "Candlebook", obj: obj_candlebook},
	{name: "Bed",  obj: obj_bed},
    {name: "bookshelf",  obj: obj_bookshelf},
    {name: "Guitar",   obj: obj_guitar},
	{name: "Plant", obj: obj_plant},
	{name: "Teddybear", obj: obj_teddybear},];

global.shop_open = false;
global.shop_selected = 0;
