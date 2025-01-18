//drawing the weapon
function draw_my_weapon() {
var _weaponYscl  =1;

//flipping the weapon on y axis
if aimDir > 90 && aimDir < 270
{
	_weaponYscl = -1;
}
	
draw_sprite_ext(weapon.sprite,0,x,y,1,_weaponYscl,aimDir,c_white,1);
}

function draw_enemy_weapon() {
	
var _weaponYscl = 1;

//flipping the weapon on y axis
if dir > 90 && dir < 270
{
	_weaponYscl = -1;
}
	
draw_sprite_ext(sSmith_Wesson_Model_3 ,0,x,y + 35,1, _weaponYscl, dir, c_white,1);

}

function draw_turret() {

	draw_sprite_ext(sTurretWeapon ,0, x + 1, y + 1, 1, 1, dir + 90, c_white,1);
}

//damage calculation 
	//damage create event
function get_damaged_create(_hp =15){
	maxHp = _hp;
	hp =_hp;
	damageList = ds_list_create()

}
	
	//damage cleanup event
function get_damage_cleanup(){
	ds_list_destroy(damageList);

}

function get_damaged(_damagedObj) {
	var hitConfirm = false;
// Receive damage
if (place_meeting(x, y, _damagedObj)) {
    // Create a list of damage instances
    var _instList = ds_list_create();
    instance_place_list(x, y, _damagedObj, _instList, false);

    // Iterate through the instances
    for (var i = 0; i < ds_list_size(_instList); i++) {
        var _inst = ds_list_find_value(_instList, i);
        
        // Check if this instance is already in the damage list
        if (ds_list_find_index(damageList, _inst) == -1) {
            // Add the new damage instance to the damage list
            ds_list_add(damageList, _inst);
            // Take damage
			
            hp -= _inst.damage;
            // Mark the damage instance as processed (optional)
             _inst.hitConfirm = true;
			 hitConfirm = true;
        }
    }

    // Free memory
    ds_list_destroy(_instList);
}

// Clear the damage list of objects that no longer exist or aren't touching anymore
var _damageListSize = ds_list_size(damageList);
for (var i = 0; i < _damageListSize; i++) {
    var _inst = ds_list_find_value(damageList, i);
    // If not touching or instance no longer exists, remove it
    if (!instance_exists(_inst) || !place_meeting(x, y, _inst)) {
        ds_list_delete(damageList, i);
        i--;
        _damageListSize--;
    }
}

// Handle death
if (hp <= 0) {
    instance_destroy();
	}
	
	
	
	//clamp hp
	hp = clamp(hp, 0, maxHp)
	return hitConfirm;
}

//camera shake

function screen_shake (_amount =3){
	with (oCamera)
	{
		xShakeAmount =_amount;
		yShakeAmount =_amount;
	}

}