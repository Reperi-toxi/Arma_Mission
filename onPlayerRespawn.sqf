params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

// Teleport to HQSpawnPoint (works whether HQSpawnPoint is an Object or a Marker)
if (!isNil "HQSpawnPoint" && {!isNull HQSpawnPoint}) then {
    _newUnit setPosATL (getPosATL HQSpawnPoint);
    _newUnit setDir (getDir HQSpawnPoint);
} else {
    if (getMarkerColor "HQSpawnPoint" != "") then {
        _newUnit setPosATL (getMarkerPos "HQSpawnPoint");
        _newUnit setDir (markerDir "HQSpawnPoint");
    };
};

// Re-assert the money HUD layer after respawn
1 cutRsc ["MoneyHUD", "PLAIN"];

systemChat format ["Respawned at HQ. Current balance: $%1", playerMoney];