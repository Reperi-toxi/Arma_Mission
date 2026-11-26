/*
    File: scripts\makeSimpleObject.sqf
    Description: Converts a placed vehicle/object into a true Simple Object on the server.
    Usage (in Object Init):
        if (isServer) then { [this] execVM "scripts\makeSimpleObject.sqf"; };
*/

if (!isServer) exitWith {};

params [
    ["_veh", objNull, [objNull]],
    ["_delay", 0.1, [0]]
];

if (isNull _veh) exitWith {};

sleep _delay;

// Recheck in case the object was already deleted during the delay
if (isNull _veh) exitWith {};

private _pos = getPosWorld _veh;
private _dir = [vectorDir _veh, vectorUp _veh];
private _type = typeOf _veh;

deleteVehicle _veh;

private _simple = [_type, _pos, 0, true] call BIS_fnc_createSimpleObject;
_simple setPosWorld _pos;
_simple setVectorDirAndUp _dir;