/// @description Setup Values

hsp = 0;
vsp = 0;
grav = 0.1;
walksp = 4;
onGround = false;
currentJump = 0;
maxJump = 2;
jumpsp = 8;
mangoal = 5;

var CollisionLayer = layer_get_id("lyr_Collision");
CollisionTileMap = layer_tilemap_get_id(CollisionLayer);

// Sprite info
sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
bbox_center_x = (bbox_right - bbox_left) * .5 + bbox_left; 
bbox_center_y = (bbox_bottom - bbox_top) * .5 + bbox_top;


	