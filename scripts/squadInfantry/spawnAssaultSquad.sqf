private _cost = 100;

if (isNil "playerMoney") then {
	playerMoney = 0;
};

if (playerMoney < _cost) exitWith {
	hint format ["Not enough money! You need $%1 (Current: $%2).", _cost, playerMoney];
};

// Verify the infantry spawn point prop exists
if (isNil "InfantrySpawnPoint" || { isNull InfantrySpawnPoint }) exitWith {
	hint "Infantry spawn point not found!";
};

private _anchorPos = getPosATL InfantrySpawnPoint;
private _baseDir = getDir InfantrySpawnPoint;

// Check that at least the squad center has clear ground nearby
private _centerSafe = _anchorPos findEmptyPosition [0, 25, "B_Soldier_F"];
if (_centerSafe isEqualTo []) exitWith {
	hint "No clear space around the infantry spawn point!";
};

private _unitClassnames = [
	"B_Soldier_TL_F",   // Team Leader
	"B_Soldier_AR_F",   // Autorifleman (MX SW)
	"B_Soldier_GL_F",   // Grenadier (MX 3GL)
	"B_medic_F"         // Combat Life Saver (Medic)
];

// Spread offsets (distance in meters, angle offset relative to InfantrySpawnPoint direction)
private _spreadOffsets = [
	[2.0, 0],
	[3.5, 60],
	[3.5, -60],
	[5.0, 180]
];

// Deduct cost only after confirming the spawn area is valid
playerMoney = playerMoney - _cost;

private _assaultGroup = createGroup [west, true];

{
	private _class = _x;
	private _offset = if (_forEachIndex < count _spreadOffsets) then {
		_spreadOffsets select _forEachIndex
	} else {
		[3.0 + (_forEachIndex * 1.2), (_forEachIndex * 72) mod 360]
	};

	_offset params ["_dist", "_relAngle"];
	private _candidatePos = _anchorPos getPos [_dist, _baseDir + _relAngle];
	private _unitPos = _candidatePos findEmptyPosition [0, 8, _class];

	if (_unitPos isEqualTo []) then {
		_unitPos = _candidatePos;
	};

	_unitPos set [2, 0];

	private _unit = _assaultGroup createUnit [_class, _unitPos, [], 0, "NONE"];
	_unit setDir _baseDir;
	_unit setPosATL (getPosATL _unit);
} forEach _unitClassnames;

(units _assaultGroup) joinSilent (group player);

systemChat format ["NATO Assault Squad spawned (-$%1)! Remaining: $%2", _cost, playerMoney];