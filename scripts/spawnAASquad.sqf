private _cost = 100;

if (isNil "playerMoney") then {
	playerMoney = 0;
};

if (playerMoney < _cost) exitWith {
	hint format ["Not enough money! You need $%1 (Current: $%2).", _cost, playerMoney];
};

// Find a safe spawn position 15 meters in front of the player
private _desiredPos = player getPos [15, getDir player];
private _safePos = _desiredPos findEmptyPosition [0, 30, "B_Soldier_F"];

if (_safePos isEqualTo []) exitWith {
	hint "No clear space nearby to spawn the squad!";
};

// Deduct cost only after confirming a valid spawn position
playerMoney = playerMoney - _cost;

private _unitClassnames = [
	"B_Soldier_TL_F",   // Team Leader
	"B_Soldier_AA_F",   // Missile Specialist (AA) with Titan MPRL
	"B_Soldier_AA_F",   // Missile Specialist (AA) with Titan MPRL
	"B_Soldier_AAA_F"   // Asst. Missile Specialist (AA) carrying extra missiles
];

private _aaGroup = [_safePos, west, _unitClassnames] call BIS_fnc_spawnGroup;
(units _aaGroup) joinSilent (group player);

hint format ["NATO AA Squad spawned (-$%1)! Remaining: $%2", _cost, playerMoney];