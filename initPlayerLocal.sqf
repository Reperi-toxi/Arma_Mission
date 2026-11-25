waitUntil { !isNull (findDisplay 46) };

(findDisplay 46) displayAddEventHandler ["KeyDown", {
    params ["_display", "_key"];
    
    if (_key == 35 && !dialog) then {
        createDialog "MENU2";
        true
    } else {
        false
    };
}];

if (isNil "playerMoney") then {
	playerMoney = 250;
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