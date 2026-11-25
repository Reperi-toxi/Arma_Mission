if (!hasInterface) exitWith {};

if (!alive player) exitWith {
	hint "Cannot save while unconscious or dead.";
};

saveGame;