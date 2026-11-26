waitUntil { !isNull (findDisplay 46) };

(findDisplay 46) displayAddEventHandler ["KeyDown", {
	params ["_display", "_key"];

	// Key 21 is DIK_Y ("Y")
	if (_key == 21 && !dialog) then {
		createDialog "MainMenu";
		true
	} else {
		false
	};
}];

if (isNil "playerMoney") then {
	playerMoney = 500;
};

// Display the persistent HUD on layer 1
1 cutRsc ["MoneyHUD", "PLAIN"];

// Keep the on-screen counter synced whenever playerMoney changes
[] spawn {
	disableSerialization;
	private _lastMoney = -1;

	while {true} do {
		if (playerMoney != _lastMoney) then {
			private _display = uiNamespace getVariable ["MoneyHUD_Display", displayNull];
			if (!isNull _display) then {
				private _ctrl = _display displayCtrl 1001;
				_ctrl ctrlSetText format ["Money: $%1", playerMoney];
				_lastMoney = playerMoney;
			};
		};
		sleep 0.2;
	};
};

// Reward $50 for enemy soldiers, deduct $200 for civilians (minimum $0)
addMissionEventHandler ["EntityKilled", {
	params ["_killed", "_killer", "_instigator"];
	
	if (isNull _instigator) then { _instigator = UAVControl vehicle _killer select 0 };
	if (isNull _instigator) then { _instigator = _killer };

	if (_killed isKindOf "CAManBase" && { _instigator == player }) then {
		private _killedSide = side group _killed;

		if ([_killedSide, side group player] call BIS_fnc_sideIsEnemy) exitWith {
			playerMoney = playerMoney + 50;
			systemChat "+$50 (Enemy soldier eliminated)";
		};

		if (_killedSide == civilian) exitWith {
			playerMoney = (playerMoney - 200) max 0;
			systemChat format ["-$200 penalty! Civilian killed (Balance: $%1)", playerMoney];
		};
	};
}];