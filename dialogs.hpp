class VehicleSpawnMenu
{
    idd = 5001;
    movingEnable = false;

    class controls
    {
        class SpawnOffroadButton: RscButton
        {
            idc = 1600;
            text = "Spawn Offroad - $250";
            x = 0.4 * safezoneW + safezoneX;
            y = 0.4 * safezoneH + safezoneY;
            w = 0.2 * safezoneW;
            h = 0.05 * safezoneH;
            action = "closeDialog 0; [] execVM 'scripts\VehicleGround\spawnOffroad.sqf';";
        };

        class SpawnHunterButton: RscButton
        {
            idc = 1602;
            text = "Spawn Hunter - $500";
            x = 0.4 * safezoneW + safezoneX;
            y = 0.48 * safezoneH + safezoneY;
            w = 0.2 * safezoneW;
            h = 0.05 * safezoneH;
            action = "closeDialog 0; [] execVM 'scripts\VehicleGround\spawnHunter.sqf';";
        };

        class CloseMenuButton: RscButton
        {
            idc = 1601;
            text = "Cancel";
            x = 0.4 * safezoneW + safezoneX;
            y = 0.56 * safezoneH + safezoneY;
            w = 0.2 * safezoneW;
            h = 0.05 * safezoneH;
            action = "closeDialog 0;";
        };
    };
};

class infantrySpawnMenu 
{
	idd=5002;
	class controls 
	{
		class SpawnInfantryButton: RscButton
		{
			idc = 1600;
			text = "Spawn Infantry - $100"; //--- ToDo: Localize;
			x = 15.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
            action = "closeDialog 0; [] execVM 'scripts\squadInfantry\spawnAssaultSquad.sqf';";
		};
		class CancelButton: RscButton
		{
			idc = 1602;
			text = "Cancel"; //--- ToDo: Localize;
			x = 15.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			action = "closeDialog 0;";
		};
	};
};
class RscTitles
{
	class MoneyHUD
	{
		idd = -1;
		duration = 1e+11; // Stays on screen indefinitely
		fadeIn = 0;
		fadeOut = 0;
		onLoad = "uiNamespace setVariable ['MoneyHUD_Display', _this select 0];";

		class controls
		{
			class MoneyText: RscText
			{
				idc = 1001;
				style = 1; // ST_RIGHT (right-aligned text)
				text = "Money: $0";
                x = 0.41 * safezoneW + safezoneX; 
				y = 0.02 * safezoneH + safezoneY; 
				w = 0.18 * safezoneW;
				h = 0.04 * safezoneH;
				sizeEx = 0.045;
				colorText[] = {0.19, 0.19, 0.19, 1}; // text color
			};
		};
	};
};


class MainMenu
{
	idd = 5003;
	movingEnable = false;
	class controls 
	{
		class SaveGameButton: RscButton
		{
			idc = 1600;
			text = "Save Game"; //--- ToDo: Localize;
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 13.5 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			action = "closeDialog 0; [] execVM 'scripts\MainMenuScripts\saveGame.sqf';";
		};
		class CancelButton: RscButton
		{
			idc = 1601;
			text = "Cancel"; //--- ToDo: Localize;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 13.5 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			action = "closeDialog 0;";
		};
		class SellVehicleButton: RscButton
		{
			idc = 1602;
			text = "Sell Vehicle"; //--- ToDo: Localize;
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 13.5 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class TeleportBackButton: RscButton
		{
			idc = 1603;
			text = "Teleport back to HQ"; //--- ToDo: Localize;
			x = 23.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 13.5 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			action = "closeDialog 0; [] execVM 'scripts\MainMenuScripts\teleportHQ.sqf';";
		};
		class DismissInfantryButton: RscButton
		{
			idc = 1604;
			text = "Dismiss Infantry"; //--- ToDo: Localize;
			x = 23.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 13.5 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
	};
};
