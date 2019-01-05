/// @description Movement and Collision

// Movement Controls
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump = keyboard_check(vk_space);

var colTopCenter;
var colTopRight;
var colCenterRight;
var colBottomRight;
var colBottomCenter;
var colBottomLeft;
var colCenterLeft;
var colTopLeft;

hsp = walksp * (key_right - key_left);
vsp += grav;



if (vsp > 0) // Falling down
{
	colBottomLeft = tilemap_get_at_pixel(CollisionTileMap, bbox_left, bbox_bottom + 0);
	colBottomRight = tilemap_get_at_pixel(CollisionTileMap, bbox_right, bbox_bottom + 0);
	colBottomCenter = tilemap_get_at_pixel(CollisionTileMap, bbox_center_x, bbox_bottom + 0);

	if( colBottomLeft != 0 || colBottomRight != 0 || colBottomCenter != 0)
	{
		y = (( bbox_bottom & ~63) - 1) - sprite_bbox_bottom;
		vsp = 0;
		onGround = 0;
		currentJump = 0;
	}
}
else // Going upwards
{
	colTopLeft = tilemap_get_at_pixel(CollisionTileMap, bbox_left, bbox_top + 0);
	colTopRight = tilemap_get_at_pixel(CollisionTileMap, bbox_right, bbox_top + 0);
	colTopCenter = tilemap_get_at_pixel(CollisionTileMap, bbox_center_x, bbox_top + 0);

	if( colTopLeft != 0 || colTopRight != 0 || colTopCenter != 0)
	{
		y = (( bbox_top + 64) & ~63) - sprite_bbox_top;
		vsp = 0;
	}
}

if (hsp = 0) // Still, do nothing
{
	
}
else if (hsp > 0) // Moving right
{
	colTopRight = tilemap_get_at_pixel(CollisionTileMap, bbox_right + 0, bbox_top);
	colCenterRight = tilemap_get_at_pixel(CollisionTileMap, bbox_right + 0, bbox_center_y);
	colBottomRight = tilemap_get_at_pixel(CollisionTileMap, bbox_right + 0, bbox_bottom);
	
	if( colTopRight != 0 || colCenterRight != 0 || colBottomRight != 0)
	{
		x = (( bbox_right & ~63) - 1) - sprite_bbox_right;
		hsp = 0;	
	}
}
else // Moving left
{
	colTopLeft = tilemap_get_at_pixel(CollisionTileMap, bbox_left + 0, bbox_top);
	colCenterLeft = tilemap_get_at_pixel(CollisionTileMap, bbox_left + 0, bbox_center_y);
	colBottomLeft = tilemap_get_at_pixel(CollisionTileMap, bbox_left + 0, bbox_bottom);
	
	if( colTopLeft != 0 || colCenterLeft != 0 || colBottomLeft != 0)
	{
		x = (( bbox_left + 64) & ~63) - sprite_bbox_left;
		hsp = 0;	
	}
}


if( key_jump && vsp >= 0 && currentJump == 0)
{
	vsp-= jumpsp;
	currentJump++;
}


x += hsp;
y += vsp;

var mangoTarget = collision_rectangle(bbox_left, bbox_right, bbox_top, bbox_bottom, obj_Mango, false, true);
if (mangoTarget != noone)
{
	with(mangoTarget) instance_destroy();
	mangoal--;
	audio_play_sound(aud_Wow,10, false);
}

//if( hsp < 0) image_xscale = sign(hsp);
if (hsp != 0) image_xscale = sign(hsp);