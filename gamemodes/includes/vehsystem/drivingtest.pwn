/*

	 /$$   /$$  /$$$$$$          /$$$$$$$  /$$$$$$$
	| $$$ | $$ /$$__  $$        | $$__  $$| $$__  $$
	| $$$$| $$| $$  \__/        | $$  \ $$| $$  \ $$
	| $$ $$ $$| $$ /$$$$ /$$$$$$| $$$$$$$/| $$$$$$$/
	| $$  $$$$| $$|_  $$|______/| $$__  $$| $$____/
	| $$\  $$$| $$  \ $$        | $$  \ $$| $$
	| $$ \  $$|  $$$$$$/        | $$  | $$| $$
	|__/  \__/ \______/         |__/  |__/|__/

				Driving License System

				Next Generation Gaming, LLC
	(created by Next Generation Gaming Development Team)
	
	Developers:
		(*) Connor
	
	* Copyright (c) 2016, Next Generation Gaming, LLC
	*
	* All rights reserved.
	*
	* Redistribution and use in source and binary forms, with or without modification,
	* are not permitted in any case.
	*
	*
	* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
	* "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
	* LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
	* A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
	* CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
	* EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
	* PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
	* PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
	* LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
	* NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
	* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/*
    MODULE DESCRIPTION:
   		This module will control the driving school (LV), and any other's created afterwards.
        Module created by Connor.
*/
#include <YSI\y_hooks>
#define DIALOG_DSVEH_CAUTION 6941
#define DIALOG_DSVEH_RULES 6942
#define DIALOG_DSVEH_TESTBASE 6943
#define CHECKPOINT_DRIVINGSCHOOL 2539

forward checkTestVehicle(playerid);

new Float:dsPoints[][3] = 
{
    {-2064.9561, -67.7125, 34.8247},
    {-2110.5261, -67.8857, 34.8247},
    {-2154.2473, -67.6854, 34.8231},
    {-2169.3850, -82.5202, 34.8302},
    {-2169.8767, -114.5743, 34.8188},
    {-2170.6482, -162.7804, 34.8249},
    {-2215.5796, -187.5162, 34.8745},
    {-2244.0376, -187.6771, 34.8235},
    {-2259.1860, -202.9163, 34.9007},
    {-2259.7864, -253.0544, 39.7875},
    {-2260.3638, -300.5378, 48.1640},
    {-2259.5361, -339.2552, 50.5190},
    {-2258.4385, -371.1333, 50.5193},
    {-2236.2454, -416.2657, 50.5155},
    {-2195.2356, -459.0606, 49.3517},
    {-2155.1711, -497.7458, 41.1217},
    {-2117.1301, -536.1792, 34.2394},
    {-2059.1565, -577.5410, 29.0998},
    {-1984.6453, -582.2720, 25.5633},
    {-1925.5862, -583.2345, 24.0926},
    {-1885.5591, -583.6432, 24.0940},
    {-1821.1207, -583.9514, 15.9855},
    {-1816.3672, -559.6774, 15.8619},
    {-1821.3180, -527.9517, 14.6263},
    {-1819.6934, -462.3056, 14.6151},
    {-1809.8923, -396.5690, 16.1884},
    {-1798.9331, -317.3351, 24.3122},
    {-1796.9186, -239.6917, 17.8804},
    {-1797.0546, -168.9667, 9.4126},
    {-1797.6467, -125.6053, 5.1712},
    {-1811.8171, -114.1203, 5.1504},
    {-1841.5179, -114.4944, 5.1483},
    {-1882.5660, -106.9792, 14.5634},
    {-1911.3077, -79.0253, 24.6949},
    {-1938.0209, -62.3110, 25.2069},
    {-1975.7996, -64.1764, 27.7167},
    {-2014.0769, -67.5033, 34.8182},
    {-2040.5736, -67.4500, 34.8250},
    {-2046.2883, -84.8129, 34.8103},
	{-2068.5259, -84.6942, 34.8201}
};

//player_get_speed
// PVARS: pDTest (Is the player testing), pTestMarker (The marker the player is on),  pTestZone (Roads, Highways), pTestVeh (The vehicle the player is testing with)
new pFindDrive[MAX_PLAYERS];
new pDriveTimer[MAX_PLAYERS];

DrivingTestFinish(playerid)
{
	new pTestVeh = GetPVarInt(playerid, "PTestVeh");
	DestroyVehicle(pTestVeh);
	DeletePVar(playerid, "pTestVeh");
	DeletePVar(playerid, "pDTest");
	DeletePVar(playerid, "pTestMarker");
	DisablePlayerCheckpoint(playerid);
	PlayerInfo[playerid][pCarLic] = gettime() + (86400*80);
	SendClientMessageEx(playerid, COLOR_WHITE, "Driving Instructor: You have successfully completed driving school and earned your license!");
	return 1;
}

DrivingSchoolSpeedMeter(playerid, Float:speed)
{
	new 
		pTestMarker = GetPVarInt(playerid, "pTestMarker"),
		maxspeed = 0; 

	/*if(pTestMarker < 20 || pTestMarker >= 29)
	{
		if(speed > 50)
		{
			SetPlayerCheckpoint(playerid, 814.0655,-600.5410,16.0355, 4.0);
			SendClientMessageEx(playerid, COLOR_GREY, "You have exceeded the resdiental speed limit of 50MPH, you have failed the test.");
			SetPVarInt(playerid, "pDTest", 2);
		}
	}
	else if(speed >= 100)
	{
		SetPlayerCheckpoint(playerid, 814.0655,-600.5410,16.0355, 4.0);
		SendClientMessageEx(playerid, COLOR_GREY, "You have exceeded the freeway speed limit of 100MPH, you have failed the test.");
		SetPVarInt(playerid, "pDTest", 2);
	}*/

	switch(pTestMarker) {
		case 0 .. 7: maxspeed = 50;
		case 8 .. 19: maxspeed = 75;
		case 20 .. 36: maxspeed = 50; 
	}

	if(speed > (maxspeed + 5) && GetPVarInt(playerid, "pDTest") != 2) {
		format(szMiscArray, sizeof(szMiscArray), "You have exceeded the max speed limit of %d MPH.", maxspeed);
		SendClientMessageEx(playerid, COLOR_GREY, szMiscArray);
		SetPlayerCheckpoint(playerid, 814.0655,-600.5410,16.0355, 4.0);
		SetPVarInt(playerid, "pDTest", 2);
	}
	return 1;
}

hook OnGameModeInit()
{
	//CreateDynamicPickup(1239, 1, 1173.0698,1348.4688,10.9219);
	//CreateDynamic3DTextLabel("/drivingtest to begin the driving test.", 0xFF0000FF, 1173.0698,1348.4688,10.9219,4.0);
	return 1;
}

hook OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(GetPVarType(playerid, "pDTest") > 0)
	{
		new pTestVeh = GetPVarInt(playerid, "pTestVeh");
		if(oldstate == PLAYER_STATE_DRIVER && newstate == PLAYER_STATE_ONFOOT)
		{
			pDriveTimer[playerid] = SetTimerEx("checkTestVehicle", 60000, false, "i", playerid);
			SendClientMessageEx(playerid, COLOR_YELLOW, "You have 60 seconds to get back in your vehicle or it will be taken back.");
		}
		else if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER && GetPlayerVehicleID(playerid) == pTestVeh)
		{
			KillTimer(pDriveTimer[playerid]);
		}
	}
	else if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER)
	{
		if(PlayerInfo[playerid][pCarLic] < gettime())
		{
			SendClientMessageEx(playerid, COLOR_YELLOW, "Warning: Your drivers license has expired. Head to the DMV to renew it.");
		}
	}
	return 1;
}

public checkTestVehicle(playerid)
{
	if(GetPVarType(playerid, "pDTest") > 0)
	{
		if(GetPlayerVehicleID(playerid) > 0) return 1;
		new pTestVeh = GetPVarInt(playerid, "PTestVeh");
		DestroyVehicle(pTestVeh);
		DeletePVar(playerid, "pTestVeh");
		DeletePVar(playerid, "pDTest");
		DeletePVar(playerid, "pTestMarker");
		DisablePlayerCheckpoint(playerid);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SMS: You have failed your driving test. , Sender: Driving Instructor (555)");
	}
	return 1;
}

hook OnPlayerDisconnect(playerid)
{
	if(GetPVarType(playerid, "PTestVeh"))
	{
		new pTestVeh = GetPVarInt(playerid, "PTestVeh");
		DestroyVehicle(pTestVeh);
	}
	pFindDrive[playerid] = 0;
	pDriveTimer[playerid] = 0;
}

hook OnPlayerEnterCheckpoint(playerid){
	if(pFindDrive[playerid] == 1)
	{
		pFindDrive[playerid] = 0;
		DisablePlayerCheckpoint(playerid);
		SendClientMessageEx(playerid, COLOR_GREY, "You have arrived at the driving school!");
	}
	else if(gPlayerCheckpointStatus[playerid] == CHECKPOINT_DRIVINGSCHOOL)
	{
		new pDTest = GetPVarInt(playerid, "pDTest");
		if(pDTest == 1)
		{
			new pTestMarker = GetPVarInt(playerid, "pTestMarker");
			pTestMarker += 1;
			if(pTestMarker >= sizeof(dsPoints)) return DrivingTestFinish(playerid);
			SetPlayerCheckpoint(playerid, dsPoints[pTestMarker][0], dsPoints[pTestMarker][1], dsPoints[pTestMarker][2], 4.0);
			SetPVarInt(playerid, "pTestMarker", pTestMarker);
		}
		else if(pDTest == 2)
		{
			new pTestVeh = GetPVarInt(playerid, "PTestVeh");
			DestroyVehicle(pTestVeh);
			DeletePVar(playerid, "pTestVeh");
			DeletePVar(playerid, "pDTest");
			DeletePVar(playerid, "pTestMarker");
			DisablePlayerCheckpoint(playerid);
		}
	}
	return 1;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {

	if(arrAntiCheat[playerid][ac_iFlags][AC_DIALOGSPOOFING] > 0) return 1;
	switch(dialogid)
	{
		case DIALOG_DSVEH_CAUTION:
		{
			if(response)
			{
				//1138.3353,1375.6553,10.4057
				ShowPlayerDialogEx(playerid, 
				DIALOG_DSVEH_RULES,
				DIALOG_STYLE_MSGBOX,
				"Driving Rules", 
				"The rules of the road are as follows..\n1. You must drive on the right side of the road.\n2. You must follow speed limits at all times.\n3. Your seatbelt must be on at all times.\n4. Your vehicle lights must be on at night.\n5. If you get in an accident, you must report it.\n6. You must park correctly at all times.",
				"Next",
				"Cancel");
			}
			else return SendClientMessageEx(playerid, COLOR_GREY, "You have cancelled the driving test.");
		}
		case DIALOG_DSVEH_RULES:
		{
			if(response)
			{
				ShowPlayerDialogEx(playerid, 
				DIALOG_DSVEH_TESTBASE,
				DIALOG_STYLE_LIST,
				"{FF0000}If you crash into a vehicle, you must...",
				"Run away\nDrive away\nReport the accident to your insurance and police.", "Choose", "Cancel");
			}
		}
		case DIALOG_DSVEH_TESTBASE:
		{
			if(response)
			{
				if(listitem == 2)
				{
					ShowPlayerDialogEx(playerid, 
					DIALOG_DSVEH_TESTBASE+1,
					DIALOG_STYLE_LIST,
					"{FF0000}You must drive on the LEFT side of the road..",
					"True\nFalse", "Choose", "Cancel");
				}
				else
				{
					return SendClientMessageEx(playerid, COLOR_GREY, "You have failed the test. Incorrect answer.");
				}
			}
		}
		case DIALOG_DSVEH_TESTBASE+1:
		{
			if(response)
			{
				if(listitem == 1)
				{
					ShowPlayerDialogEx(playerid, 
					DIALOG_DSVEH_TESTBASE+2,
					DIALOG_STYLE_LIST,
					"{FF0000}If the speed limit is 50mph, you must go..",
					"650mph\n120mph\n100mph\n50mph\n300mph\n430mph", "Choose", "Cancel");
				}
				else
				{
					return SendClientMessageEx(playerid, COLOR_GREY, "You have failed the test. Incorrect answer.");
				}
			}
		}
		case DIALOG_DSVEH_TESTBASE+2:
		{
			if(response)
			{
				if(listitem == 3)
				{
					ShowPlayerDialogEx(playerid, 
					DIALOG_DSVEH_TESTBASE+3,
					DIALOG_STYLE_LIST,
					"{FF0000}Your seatbelt must always be on.",
					"True\nFalse", "Choose", "Cancel");
				}
				else
				{
					return SendClientMessageEx(playerid, COLOR_GREY, "You have failed the test. Incorrect answer.");
				}
			}
		}
		case DIALOG_DSVEH_TESTBASE+3:
		{
			if(response)
			{
				if(listitem == 0)
				{
					SetPlayerVirtualWorld(playerid, 0);
					SetPlayerInterior(playerid, 0);
					SetPVarInt(playerid, "PTestVeh", CreateVehicle(410, -2047.1056, -87.7183, 34.8219, 0.1447, 1, 1, -1));
					new pTestVeh = GetPVarInt(playerid, "PTestVeh");
					PutPlayerInVehicle(playerid, pTestVeh, 0);
					SendClientMessageEx(playerid, COLOR_WHITE, "Driving Instructor: Please make sure you go a max of 50mph in the residential areas. You may now begin.");
					if(!PlayerInfo[playerid][pSpeedo])
					{
						SendClientMessageEx(playerid, COLOR_WHITE, "Your speedometer has been enabled for you.");
						PlayerInfo[playerid][pSpeedo] = 1;
						ShowVehicleHUDForPlayer(playerid);
					}
					SetPVarInt(playerid, "PDTest", 1);
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid, dsPoints[0][0], dsPoints[0][1], dsPoints[0][2], 4.0);
					SetPVarInt(playerid, "pTestMarker", 0);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_DRIVINGSCHOOL;
				}
				else
				{
					return SendClientMessageEx(playerid, COLOR_GREY, "You have failed the test. Incorrect answer.");
				}
			}
		}
		
		
	}
	return 0;
}