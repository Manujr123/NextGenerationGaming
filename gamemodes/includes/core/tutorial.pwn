//Removed choose nation and it's check on regis
// Instead of dialog it calls a model selction for skins


/*

	 /$$   /$$  /$$$$$$          /$$$$$$$  /$$$$$$$
	| $$$ | $$ /$$__  $$        | $$__  $$| $$__  $$
	| $$$$| $$| $$  \__/        | $$  \ $$| $$  \ $$
	| $$ $$ $$| $$ /$$$$ /$$$$$$| $$$$$$$/| $$$$$$$/
	| $$  $$$$| $$|_  $$|______/| $$__  $$| $$____/
	| $$\  $$$| $$  \ $$        | $$  \ $$| $$
	| $$ \  $$|  $$$$$$/        | $$  | $$| $$
	|__/  \__/ \______/         |__/  |__/|__/

						Tutorial System
								Winterfield

				Next Generation Gaming, LLC
	(created by Next Generation Gaming Development Team)
					
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

#include <YSI\y_hooks>

new TutorialTime[MAX_PLAYERS];

AdvanceTutorial(playerid) 
{
	switch(PlayerInfo[playerid][pTut])
	{
		case -1:
		{
			PlayerInfo[playerid][pAccount] = 0;
			PlayerInfo[playerid][pInsurance] = 2;
			PlayerInfo[playerid][pConnectHours] = 2; // remove after launch
		   	ResetPlayerCash(playerid);
			Streamer_UpdateEx(playerid, 1715.0687, -1899.5597, 13.5665);
			SetPlayerPos(playerid,  1715.0687, -1899.5597, 13.5665);
			SetPlayerFacingAngle(playerid, 0.0000);
			TogglePlayerSpectating(playerid, false);

			SendClientMessageEx(playerid, COLOR_GREEN, "Welcome back to Next Generation Gaming!");
			SendClientMessageEx(playerid, COLOR_WHITE, "If you need any assistance type /newb!");
			SendClientMessageEx(playerid, COLOR_WHITE, "If you need any admin assistance type /report!");
			SendClientMessageEx(playerid, COLOR_WHITE, "For a list of server commands type /help!"); 

			new string[128];
			format(string, sizeof(string), "* %s steps out of the train with a duffel bag filled with cash.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			TogglePlayerSpectating(playerid, false);
		}
		case 0:
		{
			IsSpawned[playerid] = 1;
			ClearChatbox(playerid);
			TogglePlayerSpectating(playerid, 1);

			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, playerid + 1);

			InterpolateCameraPos(playerid, -1122.733520, 566.428039, 74.477111, -1510.870727, 756.345947, 63.822765, 5000, CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, -1127.130615, 568.792968, 74.746513, -1515.371093, 758.518188, 63.654830, 5000, CAMERA_MOVE);

			KillTimer(TutorialTime[playerid]);
			SetPVarInt(playerid, "pTutorialTimer", 5);
			TutorialTime[playerid] = SetTimerEx("TutorialTimer", 1000, true, "i", playerid);
			ShowTutorialDialog(playerid, 0);
		}
		case 1:
		{

			InterpolateCameraPos(playerid, -2143.447509, 731.122680, 72.378211, -2238.905761, 731.552978, 58.697544, 5000, CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, -2148.427001, 731.456237, 72.073715, -2243.650390, 731.766723, 57.134353, 5000, CAMERA_MOVE);

			KillTimer(TutorialTime[playerid]);
			SetPVarInt(playerid, "pTutorialTimer", 5);
			TutorialTime[playerid] = SetTimerEx("TutorialTimer", 1000, true, "i", playerid);
			ShowTutorialDialog(playerid, 1);
		}
		case 2:
		{
			InterpolateCameraPos(playerid, -2322.297851, -440.815429, 97.357841, -2664.391113, -267.085327, 97.357841, 5000, CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, -2320.356445, -436.208374, 97.435958, -2662.128173, -262.629547, 97.517967, 5000, CAMERA_MOVE);

			KillTimer(TutorialTime[playerid]);
			SetPVarInt(playerid, "pTutorialTimer", 5);
			TutorialTime[playerid] = SetTimerEx("TutorialTimer", 1000, true, "i", playerid);
			ShowTutorialDialog(playerid, 2);
		}
		case 3:
		{
			InterpolateCameraPos(playerid, -1684.865722, 743.033691, 29.850921, -1574.499145, 745.213928, 29.850921, 5000, CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, -1684.767089, 738.038757, 29.649061, -1574.400512, 740.218994, 29.649061, 5000, CAMERA_MOVE);

			KillTimer(TutorialTime[playerid]);
			SetPVarInt(playerid, "pTutorialTimer", 5);
			TutorialTime[playerid] = SetTimerEx("TutorialTimer", 1000, true, "i", playerid);
			ShowTutorialDialog(playerid, 3);
		}
		case 4:
		{
			InterpolateCameraPos(playerid, -2595.721923, 33.659851, 24.744461, -2607.914062, 119.301635, 16.830526, 5000, CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, -2599.516113, 36.653709, 23.463247, -2611.972167, 122.158187, 16.219982, 5000, CAMERA_MOVE);

			KillTimer(TutorialTime[playerid]);
			SetPVarInt(playerid, "pTutorialTimer", 5);
			TutorialTime[playerid] = SetTimerEx("TutorialTimer", 1000, true, "i", playerid);
			ShowTutorialDialog(playerid, 4);
		}
		case 5:
		{
			InterpolateCameraPos(playerid, -1737.198974, 1304.578002, 35.935195, -1710.052124, 1332.307250, 18.017002, 5000, CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, -1733.976440, 1307.685913, 33.708843, -1706.902221, 1335.733886, 16.190401, 5000, CAMERA_MOVE);

			ShowTutorialDialog(playerid, 5);
		}
		case 6 .. 10: ShowTutorialDialog(playerid, PlayerInfo[playerid][pTut]);
		case 11:
		{
			InterpolateCameraPos(playerid, -1604.001464, 1212.186523, 23.727670, -1626.802612, 1254.686767, 23.727670, 5000, CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, -1608.997558, 1212.001586, 23.799192, -1630.290405, 1251.115844, 24.017780, 5000, CAMERA_MOVE);

			ShowTutorialDialog(playerid, 11);
			SetPlayerInterior(playerid, 0);
		}
		case 12:
		{
			InterpolateCameraPos(playerid, -2013.200073, 322.930023, 58.875057, -2001.977294, 164.362823, 31.042732, 5000, CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, -2009.534423, 319.748992, 57.673305, -1998.311645, 161.181793, 29.840980, 5000, CAMERA_MOVE);

			ShowTutorialDialog(playerid, 12);
		}
		case 13:
		{
			CharacterCreation(playerid);
	 		SetPlayerSkin(playerid, 75);
	 		AdjustActor(playerid, 75);
            InterpolateCameraPos(playerid, -2019.664062, 152.377548, 59.839912, -1986.805541, 138.156478, 29.130123, 5000, CAMERA_MOVE);
            InterpolateCameraLookAt(playerid, -2016.082519, 154.167465, 56.845172, -1982.372680, 138.933883, 26.951782, 5000, CAMERA_MOVE);
		}
		case 14: CharacterCreation(playerid);
		case 15:
		{
			if(IsSpawned[playerid] == 0) return 1;
			SendClientMessageEx(playerid, COLOR_GREY, "-----------------------------");
			SendClientMessageEx(playerid, COLOR_WHITE, "Objective: Purchase a vehicle.");
			SendClientMessageEx(playerid, COLOR_WHITE, "Head the checkpoint on your map to purchase a vehicle.");
			SendClientMessageEx(playerid, COLOR_GREY, "-----------------------------");

			SetPlayerCheckpoint(playerid, -1968.2156,293.7960,35.1719, 5.0);

		}
		case 16:
		{
			if(IsSpawned[playerid] == 0) return 1;
			SendClientMessageEx(playerid, COLOR_GREY, "-----------------------------");
			SendClientMessageEx(playerid, COLOR_WHITE, "Objective: Withdraw money from the bank.");
			SendClientMessageEx(playerid, COLOR_WHITE, "Head the checkpoint on your map to withdraw money.");
			SendClientMessageEx(playerid, COLOR_GREY, "-----------------------------");
			SetPlayerCheckpoint(playerid, -1580.9592,866.6301,7.6953, 5.0);
		}
		case 17:
		{
			if(IsSpawned[playerid] == 0) return 1;
			SendClientMessageEx(playerid, COLOR_GREY, "-----------------------------");
			SendClientMessageEx(playerid, COLOR_WHITE, "Objective: Buy a phone.");
			SendClientMessageEx(playerid, COLOR_WHITE, "Head the checkpoint on your map to purchase a phone.");
			SendClientMessageEx(playerid, COLOR_GREY, "-----------------------------");

			SetPlayerCheckpoint(playerid, -1989.1060,884.8534,46.5406, 5.0);
		}
		case 18:
		{
			if(IsSpawned[playerid] == 0) return 1;
			SendClientMessageEx(playerid, COLOR_GREY, "-----------------------------");
			SendClientMessageEx(playerid, COLOR_WHITE, "You have completed the objectives tutorial. Welcome to Next Generation Gaming!");
			SendClientMessageEx(playerid, COLOR_GREY, "-----------------------------");

			PlayerInfo[playerid][pTut] = -1;
		}
	}
	return 1;
}

CharacterCreation(playerid)
{
	switch(PlayerInfo[playerid][pTut])
	{
		case 13:
		{
			szMiscArray[0] = 0;
			new genderstring[12];

			switch(PlayerInfo[playerid][pSex])
			{
				case 1: genderstring = "Male";
				case 2: genderstring = "Female";
				default: genderstring = "Unspecified";
			}

			format(szMiscArray, sizeof(szMiscArray), "Name:\t%s\n\
				Gender:\t%s\n\
				Date of Birth\t%s\n\
				Accent:\t%s\n\
				Skin ID:\t%i\n\
				Complete",
				GetPlayerNameEx(playerid),
				genderstring,
				PlayerInfo[playerid][pBirthDate],
				GetPlayerAccent(playerid),
				PlayerInfo[playerid][pModel]);
			return ShowPlayerDialogEx(playerid, DIALOG_REGISTER_CREATION, DIALOG_STYLE_TABLIST, "NG:RP | Character Creation", szMiscArray, "Select", "");
		}
		case 14: 
		{

			ClearChatbox(playerid);
			SendClientMessageEx(playerid, COLOR_GREEN, "Welcome back to Next Generation Gaming!");
			SendClientMessageEx(playerid, COLOR_WHITE, "If you need any assistance type /newb!");
			SendClientMessageEx(playerid, COLOR_WHITE, "If you need any admin assistance type /report!");
			SendClientMessageEx(playerid, COLOR_WHITE, "For a list of server commands type /help!"); 

			new string[128];
			format(string, sizeof(string), "* %s steps out of the train with a duffel bag filled with cash.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			TogglePlayerSpectating(playerid, false);
			DestroyActor(GetPVarInt(playerid, "pActor"));
			TogglePlayerSpectating(playerid, false);
			Streamer_UpdateEx(playerid, 1715.0687, -1899.5597, 13.5665);
			SetPlayerPos(playerid,  1715.0687, -1899.5597, 13.5665);
			SetPlayerFacingAngle(playerid, 0.0000);				
			SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetHealth(playerid, 100);
		
			ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, "NG:RP Tutorial - Welcome", "Would you like to have the server provide you with objectives to guide you around the server?", "Yes, please!", "No, thanks.");
		}
	}
	return 1;
}

ShowTutorialDialog(playerid, stage)
{
	new countstring[10];

	if(GetPVarInt(playerid, "pTutorialTimer") == 0) { format(countstring, 10, "Continue"); }
	else valstr(countstring, GetPVarInt(playerid, "pTutorialTimer"));

	switch(stage)
	{
		case 0:
		{
			if(betaserver == 0) {
				szMiscArray = "{FFFFFF}_______________________________________________________________________________________________________________________________________________________\n\n\n";
				strcat(szMiscArray, "{7091B8}Welcome to Next Generation Gaming!{FFFFFF}\n\n");
				strcat(szMiscArray, "We are an english speaking community. At NG:RP, we specialize in Roleplay, the act of taking on the role of a character and acting as that character\n");
				strcat(szMiscArray, "as you would in real life. Along the way your character learns new information and allows them to develop.\n\n");
				strcat(szMiscArray, "As a community, we've been around since 2010 and have grown significantly since then.\n\n");
				strcat(szMiscArray, "{FF0000}NG:RP Related Services{FFFFFF}:\n");
				strcat(szMiscArray, "\t{F69500}Website{FFFFFF}: ng-gaming.com - Sign up on our forums and interact with the community!\n");
				strcat(szMiscArray, "\t{F69500}User Control Panel{FFFFFF}: cp.ng-gaming.com - Control your account and take measures to ensure your account's security!\n");
			//	strcat(szMiscArray, "\t{F69500}Shop{FFFFFF}: shop.ng-gaming.com - Purchase credits from the shop and purchase items in game!\n");
				strcat(szMiscArray, "\t{F69500}TeamSpeak{FFFFFF}: ts.ng-gaming.com - Connect and speak to different members of the community!\n");
		//		strcat(szMiscArray, "\t{F69500}Image Sharing{FFFFFF}: ngg.up - Share your favourite images with your friends, with the press of a button.\n\n");
				strcat(szMiscArray, "Please make sure you read this tutorial as you will be asked questions at the end.");
				strcat(szMiscArray, "\n\n\n{FFFFFF}_______________________________________________________________________________________________________________________________________________________");
				ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, "NG:RP Tutorial - Welcome", szMiscArray, countstring, "");
			}
			else {
				szMiscArray = "{FFFFFF}___________________________________________________________________________________________\n\n\n";
				strcat(szMiscArray, "{7091B8}Welcome to Next Generation Gaming Beta Server!{FFFFFF}\n\n");
				strcat(szMiscArray, "You are not required to sit through the tutorial, please just press \"Got it\" at the bottom.\n");
				strcat(szMiscArray, "You'll be taken stright to the character creation screen.\n\n");
				strcat(szMiscArray, "\n\n\n{FFFFFF}_______________________________________________________________________________");
				ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, "NG:RP Beta Server - Welcome", szMiscArray, "Got It", "");
			}
		}
		case 1:
		{
			szMiscArray = "{FFFFFF}_______________________________________________________________________________________________________________________________________________________\n\n\n";
			strcat(szMiscArray, "{F69500}Roleplay{FFFFFF}\n\n");
			strcat(szMiscArray, "In order to roleplay, you should create a character. Every character should have a story, every character needs a story! Who are they? Where do\n");
			strcat(szMiscArray, "they come from? Why are they in San Andreas? That's all up to you!\n\n");
			strcat(szMiscArray, "But first you should get to know some of the terminology we use at Next Generation Gaming.\n\n");
			strcat(szMiscArray, "\t{FF0000}In Character (IC){FFFFFF}: Anything that constitutes your character, or involves them. This is accomponied by the in-game text chat, radio's, cell phones, etc.\n");
			strcat(szMiscArray, "\t\tExample: Your character is talking to another character. You might say \"Hi, what's your name?\" This conversation is in character.\n\n");
			strcat(szMiscArray, "\t{FF0000}Out Of Character (OOC){FFFFFF}: This is you speaking, not your character! Anything that has to do with you personally is considered out of character. Out of\n");
			strcat(szMiscArray, "\tCharacter should always be present with 'OOC Brackets', in other words: (( This chat is now OOC because of the double parenthesis )).\n");
			strcat(szMiscArray, "\t\tExample: You are talking to your friend about the football game last night. You might say, \"(( Did you see that amazing catch? ))\". This\n");
			strcat(szMiscArray, "\t\tis considered out of character because of the use of 'OOC Brackets'.\n\n");
			strcat(szMiscArray, "You should also learn the two most commonly used commands to perform roleplay.\n\n");
			strcat(szMiscArray, "\t{FF0000}/me [action]{FFFFFF} - This allows your character to perform an action or statement, it will broadcast a local message to other players around you.\n");
			strcat(szMiscArray, "\t\tExample: /me picks up a stick from the ground.\n");
			strcat(szMiscArray, "\t{FF0000}/do [action]{FFFFFF} - This command describes an action or statement, it's also used to gain information in character'ly about other characters.\n");
			strcat(szMiscArray, "\t\tExample: /do The stick is brown.\n\n");
			strcat(szMiscArray, "Please read these definitions carefully as you will be quizzed on them afterwards.");
			strcat(szMiscArray, "\n\n\n{FFFFFF}_______________________________________________________________________________________________________________________________________________________");
			ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, "NG:RP Tutorial - Roleplay", szMiscArray, countstring, "");
		}
		case 2:
		{
			szMiscArray = "{FFFFFF}_______________________________________________________________________________________________________________________________________________________\n\n\n";
			strcat(szMiscArray, "{F69500}Rules{FFFFFF}\n\n");
			strcat(szMiscArray, "Next, you should learn some common roleplay rules that are vital in ensuring you have the best possible experience on NG:RP.\n\n");
			strcat(szMiscArray, "\t{FF0000}Metagaming (MG){FFFFFF}: Mixing IC information with OOC information, or vice versa.\n");
			strcat(szMiscArray, "\t\tExample: John_Doe doesn't know Jane_Doe, but he reports a crime she's commited to the police and tells the officer her name is Jane_Doe.\n");
			strcat(szMiscArray, "\t\tExample: John_Doe is really upset, so he decides to put a frowny face in the in character chat.\n\n");
			strcat(szMiscArray, "\t{FF0000}Powergaming (PG){FFFFFF}: Forcing another player into roleplay, or roleplaying the impossible.\n");
			strcat(szMiscArray, "\t\tExample: John_Doe uses the command /tie on Jane_Doe, without roleplaying it first, or giving her sufficient time to respond.\n\n");
			strcat(szMiscArray, "\t{FF0000}Deathmatching (DM){FFFFFF}: Attempting to kill another player without a sufficient roleplay reason.\n");
			strcat(szMiscArray, "\t\tExample: John_Doe goes up to Jane_Doe and begins to shoot at her even though they've never met.\n\n");
			strcat(szMiscArray, "\t{FF0000}Killing On Sight (KoS){FFFFFF}: Attempting to kill another player without sufficient roleplay done beforehand.\n");
			strcat(szMiscArray, "\t\tExample: John_Doe goes up to Jane_Doe and begins to shoot at her after she stole his car without roleplaying it first.\n\n");
			strcat(szMiscArray, "\t{FF0000}Revenge Killing (RK){FFFFFF}: Returning to the last place you died or engaging roleplay with the person(s) who were responsible for your death.\n");
			strcat(szMiscArray, "\t\tExample: Jane_Doe kills John_Doe, John_Doe goes back up to Jane_Doe and roleplays killing her.\n\n");
			strcat(szMiscArray, "Please read these rules carefully as you will be quizzed on them afterwards, and you may be punished if you break one!");
			strcat(szMiscArray, "\n\n\n{FFFFFF}_______________________________________________________________________________________________________________________________________________________");
			ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, "NG:RP Tutorial - Rules", szMiscArray, countstring, "");
		}
		case 3:
		{
			szMiscArray = "{FFFFFF}_______________________________________________________________________________________________________________________________________________________\n\n\n";
			strcat(szMiscArray, "{F69500}Groups{FFFFFF}\n\n");
			strcat(szMiscArray, "It's fun to be a civilian, but it's more fun to join a group.\n\n");
			strcat(szMiscArray, "\tAt Next Generation Gaming, we offer more of a diverse selection of groups that players can join. There are many different types of groups:\n");
			strcat(szMiscArray, "\t{FF0000}Government (GOV){FFFFFF}: The government imposes new laws and manages the budget of San Andreas.\n");
			strcat(szMiscArray, "\t{FF0000}Judicial (JUD){FFFFFF}: They manage the constitution of San Andreas and manage court cases against people and agencies.\n");
			strcat(szMiscArray, "\t{FF0000}Law Enforcement Agency (LEA){FFFFFF}: They enfroce the laws written by the government and arrest violators of the law.\n");
			strcat(szMiscArray, "\t{FF0000}Medic (MED){FFFFFF}: The medics respond to distress calls of those in need and bring them to the hospital.\n");
			strcat(szMiscArray, "\t{FF0000}News Agency{FFFFFF}: News reporters will broadcast live news to the whole server regarding different incidents daily.\n");
			strcat(szMiscArray, "\t{FF0000}Towing & Reposession{FFFFFF}: They go around San Andreas towing illegally parked cars or ones with outstanding tickets, impounding them.\n");
			strcat(szMiscArray, "\t{FF0000}Transportation{FFFFFF}: They taxi around individuals who service them in exchange for a small fee.\n");
			strcat(szMiscArray, "\t{FF0000}Contract Agency{FFFFFF}: They perform illegal contract hits on those who have them.\n");
			strcat(szMiscArray, "\t{FF0000}Criminal{FFFFFF}: A group of criminals who do illegal things.\n\n");
			strcat(szMiscArray, "Some groups allow you to apply to join them once you meet certain requirements! Check out all the groups at ng-gaming.com.");
			strcat(szMiscArray, "\n\n\n{FFFFFF}_______________________________________________________________________________________________________________________________________________________");
			ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, "NG:RP Tutorial - Groups", szMiscArray, countstring, "");
		}
		case 4:
		{
			szMiscArray = "{FFFFFF}_______________________________________________________________________________________________________________________________________________________\n\n\n";
			strcat(szMiscArray, "{F69500}Property{FFFFFF}\n\n");
			strcat(szMiscArray, "Players can own different property around the server, some cost more than others. Properties are meant to enhance your roleplay experience.\n\n");
			strcat(szMiscArray, "\tThere are several different types of properties:\n");
			strcat(szMiscArray, "\t{FF0000}Housing{FFFFFF}: Represented by a green icon, houses are everywhere around the server.\n");
			strcat(szMiscArray, "\t{FF0000}Businesses{FFFFFF}: These are represented by a variety of different icons depending upon their type, but these allow you to purchase different things.\n");
			strcat(szMiscArray, "\t{FF0000}Doors{FFFFFF}: Used for any purpose, they have an exterior and an interior and are typically marked by a floating downwards arrow but can have different icons.\n");
			strcat(szMiscArray, "\t{FF0000}Garages{FFFFFF}: These are used for entering and exiting with a vehicle and are represented by a text label marked \"Garage\".\n");
			strcat(szMiscArray, "\t{FF0000}Vehicles{FFFFFF}: Players may purchase vehicles from dealerships at any time, and use them when they wish.\n\n");
			strcat(szMiscArray, "You can enter and exit property by pressing 'N' on your keyboard when near the icon.");
			strcat(szMiscArray, "\n\n\n{FFFFFF}_______________________________________________________________________________________________________________________________________________________");
			ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, "NG:RP Tutorial - Groups", szMiscArray, countstring, "");
		}
		case 5:
		{
			szMiscArray = "{FFFFFF}_______________________________________________________________________________________________________________________________________________________\n\n\n";
			strcat(szMiscArray, "{F69500}Finished{FFFFFF}\n\n");
			strcat(szMiscArray, "We are now finished with the tutorial. You will now be quizzed on many of the aspects covered in the tutorial.\n\n");
			strcat(szMiscArray, "\tIf you feel you are not ready to take the quiz, you make repeat the tutorial by pressing \"Repeat\". Otherwise, hit \"Continue\".\n");
			strcat(szMiscArray, "\tIf you get any question wrong, you will be forced to retake the tutorial and will be quizzed again afterwards.\n\n");
			strcat(szMiscArray, "{FF0000}What would you like to do?{FFFFFF}");
			strcat(szMiscArray, "\n\n\n{FFFFFF}_______________________________________________________________________________________________________________________________________________________");
			ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, "NG:RP Tutorial - Groups", szMiscArray, "Continue", "Repeat");
		}
		case 6:
		{
			SetPlayerCameraPos(playerid, -2026.9594, -117.1733, 1036.1282);
			SetPlayerCameraLookAt(playerid, -2026.5365, -116.2688, 1035.9733);
			SetPlayerInterior(playerid, 3);

			SendClientMessage(playerid, -1, "You are now in the tutorial. Read the questions & answers carefully. If you miss one question, you will be forced to repeat the tutorial!");

			ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_LIST, "What is the correct way to write an out of character statement?", "Writing it in the chat box.\n\"Putting quotes around it\".\n(( Using double parenthesis. ))", "Continue", "");
		}
		case 7: ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_LIST, "What is the definition of {FF0000}Metagaming?", "Mixing IC information with OOC information.\nPlaying more than one game at one time.\nForcing another player into a roleplay situation.", "Continue", "");
		case 8: ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_LIST, "What is the definition of {FF0000}Powergaming?", "Logging in with one or more account at the same time.\nPlaying more than one game at one time.\nForcing another player into a roleplay situation.", "Continue", "");
		case 9: ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_LIST, "What is the definition of {FF0000}Deathmatching?", "Killing yourself to avoid a situation.\nWhen you run away from the police.\nKilling a person without proper roleplay reason.", "Continue", "");
		case 10: ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_LIST, "What is the definition of {FF0000}Killing on Sight?", "Killing yourself to avoid a situation.\nKilling someone without proper roleplay done prior.\nKilling a police officer.", "Continue", "");
		case 11:
		{
			szMiscArray = "{FFFFFF}_______________________________________________________________________________________________________________________________________________________\n\n\n";
			strcat(szMiscArray, "{F69500}Useful Commands{FFFFFF}\n\n");
			strcat(szMiscArray, "At Next Generation Gaming, we have a lot of commands you can use to enhance your experience. You may use /help to refer to some of these.\n\n");
			strcat(szMiscArray, "\t{FF0000}/newb(ie){FFFFFF} - Ask a question, and one of our Advisors will answer it!\n");
			strcat(szMiscArray, "\t{FF0000}/(cancel)report{FFFFFF} - Contact an administrator if you need one or report another player for breaking the rules.\n");
			strcat(szMiscArray, "\t{FF0000}/stats{FFFFFF} - View various information attached to your account.\n");
			strcat(szMiscArray, "\t{FF0000}/inv(entory){FFFFFF} - Find out how much of each item you have in your inventory.\n");
			strcat(szMiscArray, "\t{FF0000}/interact{FFFFFF} - Interact with another player by giving/selling items, etc. (You may also use RMB+Y over a player to perform this)\n");
			strcat(szMiscArray, "\t{FF0000}/pay{FFFFFF} - Pay another player a certain amount of money.\n");
			strcat(szMiscArray, "\n\n\n{FFFFFF}_______________________________________________________________________________________________________________________________________________________");
			ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, "NG:RP Tutorial - Commands", szMiscArray, "Continue", "");
		}
		case 12:
		{
			szMiscArray = "{FFFFFF}_______________________________________________________________________________________________________________________________________________________\n\n\n";
			strcat(szMiscArray, "You are now completely finished with the tutorial. Press the next button to be taken to the character creation menu.\n\n");
			strcat(szMiscArray, "\t{F69521}Developers\n");
			strcat(szMiscArray, "\t\t{F69521}Director of Development{FFFFFF}:\n\t\t\tShane\n\n");
			strcat(szMiscArray, "\t\t{F69521}Developers{FFFFFF}:\n\
				\t\t\tMiguel\n\
				\t\t\tFarva\n\
				\t\t{F69500}Past Developers{FFFFFF}:\n\
				\t\t\tAkatony\tJohn\t\tBrendan\n\
				\t\t\tBrian\t\tScott\t\tGhoulSlayer\n\
				\t\t\tZhao\t\tDonuts\t\tMo Cena\n\
				\t\t\tCalgon\t\tNeo\t\tThomasJ\n\
				\t\t\tBeren\t\tKareemtastic\tSew Sumi\n\
				\t\t\tRazbit\t\tAlexR\t\tAustin\n\
				\t\t\tDom\t\tRothschild\tWinterfield\n\
				\t\t\tJingles\tBehemoth\tWesten\n");
			strcat(szMiscArray, "\n\n{FFFFFF}_______________________________________________________________________________________________________________________________________________________");
			ShowPlayerDialogEx(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, "NG:RP - Developers", szMiscArray, "Continue", "");
		}
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {

	if(arrAntiCheat[playerid][ac_iFlags][AC_DIALOGSPOOFING] > 0) return 1;
	switch(dialogid)
	{
		case DIALOG_TUTORIAL:
		{
			switch(PlayerInfo[playerid][pTut])
			{
				case 0 .. 4:
				{
					if(betaserver == 0) {
						if(GetPVarInt(playerid, "pTutorialTimer") != 0) return ShowTutorialDialog(playerid, PlayerInfo[playerid][pTut]);
						else
						{
							PlayerInfo[playerid][pTut]++;
							AdvanceTutorial(playerid);
						}
					} else {
						PlayerInfo[playerid][pTut] = 13;
						AdvanceTutorial(playerid);
					}
				}
				case 5:
				{
					if(!response)
					{
						PlayerInfo[playerid][pTut] = 0;
						AdvanceTutorial(playerid);

						SendClientMessage(playerid, -1, "You have decided to repeat the tutorial. Please make sure to read everything carefully before moving on!");
					}
					else
					{
						PlayerInfo[playerid][pTut]++;
						AdvanceTutorial(playerid);
					}
				}
				case 6:
				{
					if(!response) return AdvanceTutorial(playerid);
					switch(listitem)
					{
						case 0, 1:
						{
							PlayerInfo[playerid][pTut] = 0;
							AdvanceTutorial(playerid);

							SendClientMessage(playerid, -1, "That's the wrong answer! You now have to retake the tutorial. Please pay more attention this time!");
						}
						default:
						{
							PlayerInfo[playerid][pTut]++;
							AdvanceTutorial(playerid);
						}
					}
				}
				case 7:
				{
					if(!response) return AdvanceTutorial(playerid);
					switch(listitem)
					{
						case 1, 2:
						{
							PlayerInfo[playerid][pTut] = 0;
							AdvanceTutorial(playerid);

							SendClientMessage(playerid, -1, "That's the wrong answer! You now have to retake the tutorial. Please pay more attention this time!");
						}
						default:
						{
							PlayerInfo[playerid][pTut]++;
							AdvanceTutorial(playerid);
						}
					}
				}
				case 8:
				{
					if(!response) return AdvanceTutorial(playerid);
					switch(listitem)
					{
						case 0, 1:
						{
							PlayerInfo[playerid][pTut] = 0;
							AdvanceTutorial(playerid);

							SendClientMessage(playerid, -1, "That's the wrong answer! You now have to retake the tutorial. Please pay more attention this time!");
						}
						default:
						{
							PlayerInfo[playerid][pTut]++;
							AdvanceTutorial(playerid);
						}
					}
				}
				case 9:
				{
					if(!response) return AdvanceTutorial(playerid);
					switch(listitem)
					{
						case 0, 1:
						{
							PlayerInfo[playerid][pTut] = 0;
							AdvanceTutorial(playerid);

							SendClientMessage(playerid, -1, "That's the wrong answer! You now have to retake the tutorial. Please pay more attention this time!");
						}
						default:
						{
							PlayerInfo[playerid][pTut]++;
							AdvanceTutorial(playerid);
						}
					}
				}
				case 10:
				{
					if(!response) return AdvanceTutorial(playerid);
					switch(listitem)
					{
						case 0, 2:
						{
							PlayerInfo[playerid][pTut] = 0;
							AdvanceTutorial(playerid);

							SendClientMessage(playerid, -1, "That's the wrong answer! You now have to retake the tutorial. Please pay more attention this time!");
						}
						default:
						{
							PlayerInfo[playerid][pTut]++;
							AdvanceTutorial(playerid);
						}
					}
				}
				case 11, 12:
				{
					PlayerInfo[playerid][pTut]++;
					AdvanceTutorial(playerid);
				}
				case 13: CharacterCreation(playerid);
				case 14:
				{
					if(!response) 
					{
						PlayerInfo[playerid][pTut] = -1;
						DisablePlayerCheckpoint(playerid);
						return SendClientMessageEx(playerid, -1, "Welcome to Next Generation Gaming! Remember to use /help if you need a refresher on commands or /newb(ie) to ask for help!");
					}
					else
					{
						PlayerInfo[playerid][pTut]++;
						AdvanceTutorial(playerid);
						SendClientMessageEx(playerid, COLOR_WHITE, "You have chosen the objectives. Please type \"/cancel objectives\" at any time to cancel.");
					}
				}
			}
		}
		case DIALOG_REGISTER_CREATION:
		{
			if(!response) return CharacterCreation(playerid);
			switch(listitem)
			{
				case 0: return CharacterCreation(playerid);
				case 1: return ShowPlayerDialogEx(playerid, DIALOG_REGISTER_SEX, DIALOG_STYLE_LIST, "NG:RP Character Creation | Select Gender", "Male\nFemale", "Select", "<<");
				case 2: return ShowPlayerDialogEx(playerid, DIALOG_REGISTER_MONTH, DIALOG_STYLE_LIST, "{FF0000}Which month was your character born?", "January\nFebruary\nMarch\nApril\nMay\nJune\nJuly\nAugust\nSeptember\nOctober\nNovember\nDecember", "Select", "<<");
		//		case 3: return ShowPlayerDialogEx(playerid, DIALOG_REGISTER_NATION, DIALOG_STYLE_LIST, "NG:RP Character Creation | Nation", "San Andreas\nNew Robada", "Select", "<<");
				case 3:
				{
					szMiscArray[0] = 0;
					szMiscArray = "No accent\n\
					British accent\n\
					Japanese accent\n\
					Chinese accent\n\
					Korean accent\n\
					Scottish accent\n\
					Irish accent\n\
					Russian accent\n\
					American accent\n\
					Spanish accent\n\
					Southern accent\n\
					Italian accent\n\
					Southern accent\n\
					Gangster accent\n\
					Australian accent\n\
					Arabic accent\n\
					Balkan accent\n\
					Canadian accent\n\
					Jamaican accent\n\
					Israeli accent\n\
					Dutch accent\n\
					Brazilian accent\n\
					German accent\n\
					Turkish accent\n\
					Kiwi accent\n\
					French accent\n\
					Korean accent\n\
					Thai accent";
					return ShowPlayerDialogEx(playerid, DIALOG_REGISTER_ACCENT, DIALOG_STYLE_LIST, "NG:RP Character Creation | Accent", szMiscArray, "Select", "<<");
				}
				case 4:
				{
					if(PlayerInfo[playerid][pSex] == 0) { 
						SendClientMessage(playerid, COLOR_YELLOW, "Please select your gender first.");
						return ShowPlayerDialogEx(playerid, DIALOG_REGISTER_SEX, DIALOG_STYLE_LIST, "NG:RP Character Creation | Gender", "Male\nFemale", "Select", "<<");
					}

               		ShowModelSelectionMenu(playerid, RegiSkins, "Select your clothes");
               	}
				
				case 5:
				{
					if(PlayerInfo[playerid][pSex] == 0)
					{
						SendClientMessage(playerid, COLOR_YELLOW, "Please pick a gender.");
						return ShowPlayerDialogEx(playerid, DIALOG_REGISTER_SEX, DIALOG_STYLE_LIST, "NG:RP Character Creation | Skin Model", "Male\nFemale", "Select", "<<");

					}
					if(strcmp(PlayerInfo[playerid][pBirthDate], "0000-00-00") == 0)
					{
						SendClientMessage(playerid, COLOR_YELLOW, "Please specify your birthdate.");
						return ShowPlayerDialogEx(playerid, DIALOG_REGISTER_MONTH, DIALOG_STYLE_LIST, "{FF0000}Which month was your character born?", "January\nFebruary\nMarch\nApril\nMay\nJune\nJuly\nAugust\nSeptember\nOctober\nNovember\nDecember", "Select", "<<");
					}

//					if(PlayerInfo[playerid][pNation] != 0 && PlayerInfo[playerid][pNation] != 1) return ShowPlayerDialogEx(playerid, DIALOG_REGISTER_NATION, DIALOG_STYLE_LIST, "NG:RP Character Creation | Nation", "San Andreas\nNew Robada", "Select", "<<");

					ShowPlayerDialogEx(playerid, DIALOG_REGISTER_REFERRED, DIALOG_STYLE_INPUT, "{FF0000}Referral System", "Have you been referred to our server by one of our players?\nIf so, please enter the player name below.\n\nIf you haven't been referred by anyone, you may press the skip button.\n\n{FF0000}Note: You must enter the player name with a underscore (Example: FirstName_LastName)", "Enter", "Skip");
					return 1;
				}
			}
		}
		case DIALOG_REGISTER_SEX:
	    {
		    if(response)
		    {
			    if(listitem == 0) {
					PlayerInfo[playerid][pSex] = 1;
					PlayerInfo[playerid][pModel] = 2;
					AdjustActor(playerid, 2);
					SendClientMessage(playerid, COLOR_YELLOW2, "Alright, so you're a male!");
					CharacterCreation(playerid);
				}
				else if(listitem == 1) {
					PlayerInfo[playerid][pSex] = 2;
					PlayerInfo[playerid][pModel] = 91;
					AdjustActor(playerid, 91);
					SendClientMessage(playerid, COLOR_YELLOW2, "Alright, so you're a female!");
					CharacterCreation(playerid);
				}
			}
			else ShowPlayerDialogEx(playerid, DIALOG_REGISTER_SEX, DIALOG_STYLE_LIST, "{FF0000}Is your character male or female?", "Male\nFemale", "Submit", "");
		}
/*		case DIALOG_REGISTER_NATION: 
		{
			if(response) 
			{
				PlayerInfo[playerid][pNation] = listitem;
				switch(listitem) 
				{
					case 0: SendClientMessageEx(playerid, COLOR_GRAD1, "You are now a citizen of San Andreas.");
					case 1: SendClientMessageEx(playerid, COLOR_GRAD1, "You are now a citizen of New Robada.");
				}
			}
			CharacterCreation(playerid);
		}
*/
		case DIALOG_REGISTER_MONTH:
	    {
			if(response)
			{
				szMiscArray[0] = 0;
				new month = listitem+1;
				SetPVarInt(playerid, "RegisterMonth", month);

				new lastdate;
				if(listitem == 0 || listitem == 2 || listitem == 4 || listitem == 6 || listitem == 7 || listitem == 9 || listitem == 11) lastdate = 32;
				else if(listitem == 3 || listitem == 5 || listitem == 8 || listitem == 10) lastdate = 31;
				else lastdate = 29;
				for(new x = 1; x < lastdate; x++)
				{
					format(szMiscArray, sizeof(szMiscArray), "%s%d\n", szMiscArray, x);
				}
				ShowPlayerDialogEx(playerid, DIALOG_REGISTER_DAY, DIALOG_STYLE_LIST, "{FF0000}Which day was your character born?", szMiscArray, "Submit", "");
			}
			else return CharacterCreation(playerid);
		}
		case DIALOG_REGISTER_DAY:
	    {
	    	szMiscArray[0] = 0;
			if(response)
			{
				new setday = listitem+1;
				SetPVarInt(playerid, "RegisterDay", setday);

				new month, day, year;
				getdate(year,month,day);
				new startyear = year-100;
				for(new x = startyear; x < year; x++)
				{
					format(szMiscArray, sizeof(szMiscArray), "%s%d\n", szMiscArray, x);
				}
				ShowPlayerDialogEx(playerid, DIALOG_REGISTER_YEAR, DIALOG_STYLE_LIST, "{FF0000}Which year was your character born?", szMiscArray, "Submit", "");
			}
			else ShowPlayerDialogEx(playerid, DIALOG_REGISTER_MONTH, DIALOG_STYLE_LIST, "{FF0000}Which month was your character born?", "January\nFebruary\nMarch\nApril\nMay\nJune\nJuly\nAugust\nSeptember\nOctober\nNovember\nDecember", "Submit", "");
		}
		case DIALOG_REGISTER_YEAR:
	    {
	    	szMiscArray[0] = 0;
			new month, day, year;
			getdate(year,month,day);
			new startyear = year-100;
			if(response)
			{
				new setyear = listitem+startyear;
				format(PlayerInfo[playerid][pBirthDate], 11, "%d-%02d-%02d", setyear, GetPVarInt(playerid, "RegisterMonth"), GetPVarInt(playerid, "RegisterDay"));
				DeletePVar(playerid, "RegisterMonth");
				DeletePVar(playerid, "RegisterDay");
				SendClientMessage(playerid, COLOR_LIGHTRED, "Your birthdate has been successfully set.");
				return CharacterCreation(playerid);
			}
			else
			{
				for(new x = startyear; x < year; x++)
				{
					format(szMiscArray, sizeof(szMiscArray), "%s%d\n", szMiscArray, x);
				}
				ShowPlayerDialogEx(playerid, DIALOG_REGISTER_YEAR, DIALOG_STYLE_LIST, "{FF0000}Which year was your character born?", szMiscArray, "Submit", "");
			}
		}
		case DIALOG_REGISTER_ACCENT:
		{
			if(response)
			{
				if(listitem == 0) PlayerInfo[playerid][pAccent] = listitem;
				if(listitem > 0) PlayerInfo[playerid][pAccent] = listitem+1;
			}
			return CharacterCreation(playerid);
		}
		case DIALOG_REGISTER_REFERRED:
		{
		    if(response)
		    {
		        if(IsNumeric(inputtext))
		        {
		            ShowPlayerDialogEx(playerid, DIALOG_REGISTER_REFERRED, DIALOG_STYLE_INPUT, "{FF0000}Error - Invalid Roleplay Name", "That is not a roleplay name\nPlease enter a proper roleplay name.\n\nExample: FirstName_LastName", "Enter", "Skip");
		            return 1;
				}
				if(strfind(inputtext, "_", true) == -1)
				{
				    ShowPlayerDialogEx(playerid, DIALOG_REGISTER_REFERRED, DIALOG_STYLE_INPUT, "{FF0000}Error - Invalid Roleplay Name", "That is not a roleplay name\nPlease enter a proper roleplay name.\n\nExample: FirstName_LastName", "Enter", "Skip");
		            return 1;
		        }
		        if(strlen(inputtext) > 20)
		        {
		            ShowPlayerDialogEx(playerid, DIALOG_REGISTER_REFERRED, DIALOG_STYLE_INPUT, "{FF0000}Error - Invalid Roleplay Name", "That name is too long\nPlease shorten the name.\n\nExample: FirstName_LastName (20 Characters Max)", "Enter", "Skip");
		            return 1;
		        }
		        if(strcmp(inputtext, GetPlayerNameExt(playerid), true) == 0)
		        {
		            ShowPlayerDialogEx(playerid, DIALOG_REGISTER_REFERRED, DIALOG_STYLE_INPUT, "{FF0000}Error", "You can't add yourself as a referrer.\nPlease enter the referrer name or press 'Skip'.\n\nExample: FirstName_LastName (20 Characters Max)", "Enter", "Skip");
		            return 1;
		        }
				for(new sz = 0; sz < strlen(inputtext); sz++)
				{
				    if(inputtext[sz] == ' ')
				    {
					    ShowPlayerDialogEx(playerid, DIALOG_REGISTER_REFERRED, DIALOG_STYLE_INPUT, "{FF0000}Error - Invalid Roleplay Name", "That is not a roleplay name\nPlease enter a proper roleplay name.\n\nExample: FirstName_LastName", "Enter", "Skip");
			            return 1;
			        }
			    }
			  	mysql_escape_string(inputtext, szMiscArray);
                format(PlayerInfo[playerid][pReferredBy], MAX_PLAYER_NAME, "%s", szMiscArray);
                mysql_format(MainPipeline, szMiscArray, sizeof(szMiscArray), "SELECT `Username` FROM `accounts` WHERE `Username` = '%e'", inputtext);
         		mysql_function_query(MainPipeline, szMiscArray, true, "OnQueryFinish", "iii", MAIN_REFERRAL_THREAD, playerid, g_arrQueryHandle{playerid});
			}
			else
			{
			    format(szMiscArray, sizeof(szMiscArray), "Nobody");
				strmid(PlayerInfo[playerid][pReferredBy], szMiscArray, 0, strlen(szMiscArray), MAX_PLAYER_NAME);
				PlayerInfo[playerid][pTut] = 14;
				AdvanceTutorial(playerid);
				SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Thanks for filling in all the information!");
			}
		}
	}
	return 0;
}

hook OnPlayerEnterCheckpoint(playerid)
{
	if(PlayerInfo[playerid][pTut] >= 0)
	{
		switch(PlayerInfo[playerid][pTut])
		{
			case 15:
			{
				DisablePlayerCheckpoint(playerid);
				SendClientMessage(playerid, COLOR_WHITE, "Enter any vehicle you can afford to purchase it!");
			}
			case 16:
			{
				DisablePlayerCheckpoint(playerid);
				SendClientMessage(playerid, COLOR_WHITE, "Enter the building, press right mouse button to aim over the bank teller and press Y to interact with them!");
			}
			case 17:
			{
				DisablePlayerCheckpoint(playerid);
				SendClientMessage(playerid, COLOR_WHITE, "Enter the building and type /buy to purchase a phone.");
			}
			default: DisablePlayerCheckpoint(playerid);
		}
	}
}

forward AdjustActor(playerid, skinid);
public AdjustActor(playerid, skinid) 
{
	new id;
	if(PlayerInfo[playerid][pTut] == 13 && GetPVarType(playerid, "pActor")) 
	{
		id = GetPVarInt(playerid, "pActor");
		if(IsValidActor(id)) DestroyActor(id);
	}

	id = CreateActor(skinid,-1983.4526, 137.5305, 27.6875, 89.7287);
	SetPVarInt(playerid, "pActor", id);
	SetActorVirtualWorld(id, playerid + 1);
	SetPlayerSkin(playerid, skinid);
	return 1;
}

forward TutorialTimer(playerid);
public TutorialTimer(playerid)
{
	if(GetPVarInt(playerid, "pTutorialTimer") > 0) 
	{
		SetPVarInt(playerid, "pTutorialTimer", GetPVarInt(playerid, "pTutorialTimer") - 1);
		ShowTutorialDialog(playerid, PlayerInfo[playerid][pTut]);
	}
	else KillTimer(TutorialTime[playerid]);
	return 1;
}

GetPlayerAccent(iPlayerID) 
{
	new accent[26];
	switch(PlayerInfo[iPlayerID][pAccent]) 	
	{
		case 0, 1: accent = "";
		case 2: accent = "British accent";
		case 3: accent = "Japanese accent";
		case 4: accent = "Chinese accent";
		case 5: accent = "Korean accent";
		case 6: accent = "Scottish accent";
		case 7: accent = "Irish accent";
		case 8: accent = "Russian accent";
		case 9: accent = "American accent";
		case 10, 12: accent = "Spanish accent";
		case 11: accent = "Southern accent";
		case 13: accent = "Italian accent";
		case 14: accent = "Gangster accent";
		case 15: accent = "Australian accent";
		case 16: accent = "Arabic accent";
		case 17: accent = "Balkan accent";
		case 18: accent = "Canadian accent";
		case 19: accent = "Jamaican accent";
		case 20: accent = "Israeli accent";
		case 21: accent = "Dutch accent";
		case 22: accent = "Brazilian accent";
		case 23: accent = "German accent";
		case 24: accent = "Turkish accent";
		case 25: accent = "Kiwi accent";
		case 26: accent = "French accent";
		case 27: accent = "Korean accent";
		case 28: accent = "Thai accent";
	}
	return accent;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if(GetPVarType(playerid, "pActor")) DestroyActor(GetPVarInt(playerid, "pActor"));
	return 1;
}

CMD:forcetutorial(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 3)
	{
		new id;
		if(sscanf(params, "u", id)) return SendClientMessageEx(playerid, COLOR_WHITE, "SYNTAX: /forcetutorial [playerid]");

		if(IsPlayerConnected(id))
		{
			szMiscArray[0] = 0;
			switch(PlayerInfo[id][pTut])
			{
				case 0 .. 12:
				{
					PlayerInfo[id][pTut] = 13;
					AdvanceTutorial(id);

					format(szMiscArray, 128, "You have sent %s to the Character Creation Menu.", GetPlayerNameEx(id));
					SendClientMessage(playerid, COLOR_WHITE, szMiscArray);
					format(szMiscArray, 128, "Administrator %s has sent you to the Character Creation Menu.", GetPlayerNameEx(playerid));
					SendClientMessage(id, COLOR_WHITE, szMiscArray);
				}
				case 13: return SendClientMessage(playerid, COLOR_WHITE, "This player is currently in the character creation menu, please wait.");
				case 14 .. 18:
				{
					PlayerInfo[id][pTut] = -1;
					AdvanceTutorial(id);

					format(szMiscArray, 128, "You have forced %s out of the tutorial.", GetPlayerNameEx(id));
					SendClientMessage(playerid, COLOR_WHITE, szMiscArray);
					format(szMiscArray, 128, "Administrator %s has forced you out of the tutorial.", GetPlayerNameEx(playerid));
					SendClientMessage(id, COLOR_WHITE, szMiscArray);
				}
				default: return SendClientMessage(playerid, COLOR_WHITE, "This player is not in the tutorial.");
			}
		}
		else return SendClientMessage(playerid, COLOR_WHITE, "This player is not connected!");
	}
	else SendClientMessage(playerid, COLOR_WHITE, "You are not authorized to perform this command!");
	return 1;
}