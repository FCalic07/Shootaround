get_damaged(oDamageParent);

var _chance = irandom(100);
var _chanceAmmo = irandom(100);


var _healthPercent = 1 - (hp/maxHp);
image_index = _healthPercent * image_number

if hp <=0 {
	instance_destroy()
	if _chance < 20
		var _inst = instance_create_depth(x, y ,depth-1, oHealthPickup);
		
	if _chanceAmmo < 20
		var _instAmmo = instance_create_depth(x, y ,depth-1, oAmmoPickup);
	}

