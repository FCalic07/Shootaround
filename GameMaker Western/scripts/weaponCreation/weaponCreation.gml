//constructor for weapons

function create_weapon (_sprite =sGun , _weaponLength,_bulletObj, _reloadTime = 60, _cooldown = 10, _totalAmmo = 20, _magazineAmmo = 5, _currentMagazineAmmo = 5, _bulletNum =1, _spread =0,_pickupSprite, _reloadSound = gunshotCock ) constructor
{
	sprite = _sprite;
	length = _weaponLength;
	bulletObj = _bulletObj;
	reloadTime = _reloadTime;
	cooldown = _cooldown;
	totalAmmo = _totalAmmo;
	magazineAmmo = _magazineAmmo
	currentMagazineAmmo = _currentMagazineAmmo;
	bulletNum=_bulletNum;
	spread = _spread;
	pickupSprite = _pickupSprite;
	soundOfReload = _reloadSound;
	
}

//weapon inventory of player
global.PlayerWeapons = array_create(0);

//weapons  
global.WeaponList = {
	
	Colt_Single_Action_Army : new create_weapon(
	sColt_Single_Action_Army,
	sprite_get_bbox_right(sColt_Single_Action_Army)- sprite_get_xoffset(sColt_Single_Action_Army),
	oBullet_Colt1,
	15,
	20,
	24,
	6,
	6,
	1,
	0,
	oBullet_Colt1,
	pistolSingleLoad
),
Smith_Wesson_Model_3 :new create_weapon(
	sSmith_Wesson_Model_3,
	sprite_get_bbox_right(sSmith_Wesson_Model_3)- sprite_get_xoffset(sSmith_Wesson_Model_3),
	oBullet_SW2,
	15,
	15,
	24,
	6,
	6,
	1,
	0,
	sSmith_Wesson_Model_3,
	pistolSingleLoad
),
Shotgun : new create_weapon(
	sShotgun,
	sprite_get_bbox_right(sShotgun)- sprite_get_xoffset(sShotgun),
	oBulletShotgun,
	60,
	65,
	16,
	2,
	2,
	7,
	40,
	pistolSingleLoad
),
Winchester : new create_weapon(
	sWinchester,
	sprite_get_bbox_right(sWinchester)- sprite_get_xoffset(sWinchester),
	oBullet_Winchester,
	80,
	47,
	14,
	7,
	7,
	1,
	0,
	sWinchester,
	winchesterSingleLoad
),
SawedShotgun : new create_weapon(
	sSawedOffShotgun,
	sprite_get_bbox_right(sSawedOffShotgun)- sprite_get_xoffset(sSawedOffShotgun),
	oBulletShotgun,
	60,
	65,
	16,
	2,
	2,
	7,
	45,
	sSawedOffShotgun
)
}





