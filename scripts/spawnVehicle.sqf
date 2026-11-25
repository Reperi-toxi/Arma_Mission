private _className = "B_MRAP_01_F";
private _desiredPos = player getPos [8, getDir player];

// Find an open spot within 25m that fits a vehicle of ~5m radius without obstacles
private _safePos = _desiredPos findEmptyPosition [0, 25, _className];

// If no empty position was found nearby, abort cleanly instead of blowing up
if (_safePos isEqualTo []) exitWith {
    hint "No clear space nearby to spawn the vehicle!";
};

// Keep ground height accurate (important on terrain or bridges)
_safePos set [2, 0];

private _veh = createVehicle [_className, _safePos, [], 0, "CAN_COLLIDE"];
_veh setDir (player getDir _veh);
_veh setPosATL (getPosATL _veh);

hint "Vehicle spawned!";