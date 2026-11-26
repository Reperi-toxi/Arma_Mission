params ["_target", "_caller", "_actionId"];

// Remove the capture option from this flagpole
_target removeAction _actionId;

// Swap to NATO flag across all clients and JIP
[_target, "\A3\Data_F\Flags\flag_NATO_CO.paa"] remoteExec ["setFlagTexture", 0, _target];

// Lower and raise flag animation
[_target, 0] remoteExec ["setFlagAnimationPhase", 0, _target];
_target spawn {
    sleep 1.5;
    [_this, 1] remoteExec ["setFlagAnimationPhase", 0, _this];
};

// Award $100 locally to the capturing player
if (_caller == player) then {
    playerMoney = (missionNamespace getVariable ["playerMoney", 0]) + 100;
    systemChat format ["+$100 (Flag captured! Balance: $%1)", playerMoney];
};

// Notify players
format ["%1 captured the flag for NATO!", name _caller] remoteExec ["systemChat", 0];