private _cost = 500;
private _className = "B_MRAP_01_F";

if (isNil "playerMoney") then {
	playerMoney = 0;
};

if (playerMoney < _cost) exitWith {
	hint format ["Not enough money! You need $%1 (Current: $%2).", _cost, playerMoney];
};

// Verify the target prop exists
if (isNil "VehicleSpawnPoint" || { isNull VehicleSpawnPoint }) exitWith {
	hint "Spawn point prop not found!";
};

private _desiredPos = getPosATL VehicleSpawnPoint;

// Find an open spot near the prop that fits the vehicle without clipping
private _safePos = _desiredPos findEmptyPosition [0, 20, _className];

if (_safePos isEqualTo []) exitWith {
	hint "No clear space around the spawn point for the vehicle!";
};

// Deduct funds only after passing balance, prop, and spawn-space checks
playerMoney = playerMoney - _cost;

private _veh = createVehicle [_className, _safePos, [], 0, "CAN_COLLIDE"];
_veh setDir (getDir VehicleSpawnPoint);
_veh setPosATL (getPosATL _veh);

hint format ["Offroad spawned (-$%1)! Remaining: $%2", _cost, playerMoney];