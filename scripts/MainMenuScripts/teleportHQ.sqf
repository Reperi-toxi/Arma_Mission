if (!hasInterface) exitWith {};

if (isNil "HQSpawnPoint" || { isNull HQSpawnPoint }) exitWith {
	hint "HQ spawn point not found!";
};

if (!alive player) exitWith {
	hint "Cannot teleport right now.";
};

// Check for any living enemy units within 150m of the player
private _playerSide = side player;
private _nearbyEnemies = allUnits select {
	alive _x
	&& { side _x != civilian }
	&& { side _x != _playerSide }
	&& { (_playerSide getFriend (side _x)) < 0.6 }
	&& { (_x distance player) <= 150 }
};

if !(_nearbyEnemies isEqualTo []) exitWith {
	hint format ["Cannot teleport to HQ! %1 hostile(s) within 150m.", count _nearbyEnemies];
	sleep 4;
	hint "";
};

// Fade screen to black over 1 second
cutText ["", "BLACK OUT", 1];
sleep 1;

// 2-second pause while screen is black before moving
sleep 2;

// Move player safely near HQSpawnPoint
private _hqPos = getPosATL HQSpawnPoint;
private _safePos = _hqPos findEmptyPosition [0, 10, typeOf player];

if (_safePos isEqualTo []) then {
	_safePos = _hqPos;
};

// If player is driving/riding a vehicle, move the vehicle; otherwise move the player
private _targetObj = if (vehicle player != player && { driver vehicle player == player }) then {
	vehicle player
} else {
	if (vehicle player != player) then { moveOut player; };
	player
};

_safePos set [2, 0];
_targetObj setDir (getDir HQSpawnPoint);
_targetObj setPosATL _safePos;

// Let terrain/objects settle briefly before fading back in
sleep 0.3;
cutText ["", "BLACK IN", 1];