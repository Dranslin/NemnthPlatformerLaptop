
// Bounding Box items
var boundingBoxSide;
var getPixelBottomLeft, getPixelBottomRight, getPixelBottomCenter;
centerPosition = (sprite_width / 2) + bbox_left;

// Basic Movement Calc
var move = key_right - key_left;

hsp = move * walksp;
vsp = grav + vsp;

// Collisions - Horizontal
getPixelBottomLeft = tilemap_get_at_pixel(CollisionTileMap, bbox_left, bbox_bottom + 1);
getPixelBottomRight = tilemap_get_at_pixel(CollisionTileMap, bbox_right, bbox_bottom + 1);
getPixelBottomCenter = tilemap_get_at_pixel(CollisionTileMap, centerPosition, bbox_bottom + 1);

show_debug_message(getPixelBottomLeft);
show_debug_message(getPixelBottomRight);
show_debug_message(getPixelBottomCenter);


if( (getPixelBottomLeft == 1) || (getPixelBottomRight == 1) || (getPixelBottomCenter == 1) ) 
	{ onGround = true; currentJump = 0; } 
else 
	{ onGround = false; }


boundingBoxSide = (hsp > 0 ? bbox_right : bbox_left);

if ((tilemap_get_at_pixel(CollisionTileMap, boundingBoxSide + hsp, bbox_top) != 0) || 
	(tilemap_get_at_pixel(CollisionTileMap, boundingBoxSide + hsp, bbox_bottom) != 0))
{
	if (hsp > 0) 
		x = x - (x mod 32) + 31 - (bbox_right - x);
	else 
		x = x - (x mod 32) - (bbox_left - x);
	
	hsp = 0;
}

// Collisions - Vertical 

boundingBoxSide = (vsp > 0 ? bbox_bottom : bbox_top);

if ((tilemap_get_at_pixel(CollisionTileMap, bbox_left, boundingBoxSide + vsp) != 0) || 
	(tilemap_get_at_pixel(CollisionTileMap, bbox_right, boundingBoxSide + vsp) != 0))
{
	if (vsp > 0) 
		y = y - (y mod 32) + 31 - (bbox_bottom - y);
	else 
		y = y - (y mod 32) - (bbox_top - y);
	
	vsp = 0;
	
}


// Horiz Collision

//if (tilemap_get_at_pixel()

// Vert Collision

x = x + hsp;
y = y + vsp;
show_debug_message(y);