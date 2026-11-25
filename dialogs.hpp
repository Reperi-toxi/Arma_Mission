class ABMenu
{
    idd = 5001;
    movingEnable = false;

    class controls
    {
        class SpawnHunterButton: RscButton
        {
            idc = 1600;
            text = "Spawn Hunter";
            x = 0.4 * safezoneW + safezoneX;
            y = 0.4 * safezoneH + safezoneY;
            w = 0.2 * safezoneW;
            h = 0.05 * safezoneH;
            action = "closeDialog 0; [] execVM 'scripts\spawnVehicle.sqf';";
        };

        class CloseMenuButton: RscButton
        {
            idc = 1601;
            text = "Cancel";
            x = 0.4 * safezoneW + safezoneX;
            y = 0.48 * safezoneH + safezoneY;
            w = 0.2 * safezoneW;
            h = 0.05 * safezoneH;
            action = "closeDialog 0;";
        };
    };
};
class MENU2 
{
	idd=5002;
	class controls 
	{
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Spawn AA squad"; //--- ToDo: Localize;
			x = 15.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
            action = "closeDialog 0; [] execVM 'scripts\spawnAASquad.sqf';";
		};
		class RscButton_1602: RscButton
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
				colorText[] = {0.2, 0.9, 0.2, 1}; // Green text
			};
		};
	};
};

