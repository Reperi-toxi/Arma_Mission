// Get units currently selected via F1-F10, excluding the player
private _selectedAI = (groupSelectedUnits player) select { !isNull _x && { alive _x } && { _x != player } };

if (_selectedAI isEqualTo []) exitWith {
	hint "Select one or more AI squad members (F2-F10) first!";
};

private _dismissedCount = 0;

{
	private _unit = _x;

	// If the unit is inside a vehicle, eject/remove cleanly before deleting
	if (!isNull objectParent _unit) then {
		moveOut _unit;
		unassignVehicle _unit;
	};

	deleteVehicle _unit;
	_dismissedCount = _dismissedCount + 1;
} forEach _selectedAI;

hint format ["Dismissed %1 selected squad member(s).", _dismissedCount];