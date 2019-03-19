// Finish checks in code
// test it works // works, just needs the strings in the commands to work.
// add actor part

// PlayerInfo[playerid][pDrugs][drug] -= amount;

#include <YSI\y_hooks>


#define DIALOG_DEALER 7567
#define DIALOG_POT 7568
#define DIALOG_CRACK 7569
#define DIALOG_HEROIN 7570
#define DIALOG_METH 7571
#define DIALOG_ECSTASY 7572

forward DrugPrices();
forward SpawnDealers();

new PotPrice1 = 400;
new CrackPrice1 = 950;
new HeroinPrice = 4000;
new MethPrice = 2000;
new EcstasyPrice = 1600;
new Dealer1;
new Dealer2;
new Dealer3;

CMD:dealers(playerid, params[])
{
	if (PlayerInfo[playerid][pJob] != 14 && PlayerInfo[playerid][pJob2] != 14 && PlayerInfo[playerid][pJob3] != 14)
	{
		SendClientMessageEx(playerid,COLOR_GREY,"You are not a Drug Dealer!");
		return 1;
	}
    new string[128];
	format(string, sizeof(string),"[Pot]: $%d", PotPrice1);
	strcat(string, "[Crack]: $%d", CrackPrice1);
	strcat(string, "[Heroin]: $%d", HeroinPrice);
	strcat(string, "[Meth]: $%d", MethPrice);
	strcat(string, "[Ecstasy]: $%d", EcstasyPrice);
	SendClientMessageEx(playerid, COLOR_WHITE, string);
	return 1;
}

CMD:selldrugs(playerid, params[])
{
	if (PlayerInfo[playerid][pJob] != 14 && PlayerInfo[playerid][pJob2] != 14 && PlayerInfo[playerid][pJob3] != 14)
	{
		SendClientMessageEx(playerid,COLOR_GREY,"You are not a Drug Dealer!");
		return 1;
	}
	if(IsPlayerInRangeOfPoint(playerid,5.0,-1709.2839,406.1629,7.4190) || IsPlayerInRangeOfPoint(playerid,5.0,-2172.4548,710.6215,53.8906) || IsPlayerInRangeOfPoint(playerid,5.0,-2574.5747,1213.4652,42.6640))
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Drug Dealer says: Hey man, you looking to sell? This is what I'll pay per gram.");
		new string[128];
		format(string, sizeof(string),"[Pot]: $%d", PotPrice1);
		strcat(string, "[Crack]: $%d", CrackPrice1);
		strcat(string, "[Heroin]: $%d", HeroinPrice);
		strcat(string, "[Meth]: $%d", MethPrice);
		strcat(string, "[Ecstasy]: $%d", EcstasyPrice);
		ShowPlayerDialogEx(playerid, DIALOG_DEALER, DIALOG_STYLE_LIST, "Drug Dealing", string, "Select", "Exit");
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "You are not near a drug dealer.");
	}
	return 1;
}

public DrugPrices()
{
    new rand = Random(500, 1300);
    PotPrice1 = rand;

    new rand1 = Random(1200, 2500);
    CrackPrice1 = rand1;

    new rand2 = Random(6500, 10000);
    HeroinPrice = rand2;

    new rand3 = Random(2500, 3500);
    MethPrice = rand3;

    new rand4 = Random(1600, 2700);
    EcstasyPrice = rand4;
	return 1;
}

public SpawnDealers()
{
    Dealer1 = CreateActor(30,-1709.2839,406.1629,7.4190,193.0859);
    SetActorInvulnerable(Dealer1 , true);
    ApplyActorAnimation(Dealer1 , "SMOKING", "M_smklean_loop", 4.0, 0, 1, 1, 1, -1);

    Dealer2 = CreateActor(28, -2172.4548,710.6215,53.8906,151.9923);
    SetActorInvulnerable(Dealer2 , true);
    ApplyActorAnimation(Dealer2 , "SMOKING", "M_smklean_loop", 4.0, 0, 1, 1, 1, -1);

    Dealer3 = CreateActor(111, -2574.5747,1213.4652,42.6640,14.4844);
    SetActorInvulnerable(Dealer3 , true);
    ApplyActorAnimation(Dealer3 , "SMOKING", "M_smklean_loop", 4.0, 0, 1, 1, 1, -1);
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
	switch(dialogid)
	{
		case DIALOG_DEALER:
		{
			if(response)
			{
				if(listitem == 0) // Pot
				{
					SendClientMessageEx(playerid, COLOR_WHITE, "Drug Dealer says: How much grass you holding?");
					ShowPlayerDialogEx(playerid, DIALOG_POT, DIALOG_STYLE_INPUT, "Drug Dealing", "How much pot do you want to sell?", "Submit", "Exit");
				}
				if(listitem == 1) // Start Crack
				{
					SendClientMessageEx(playerid, COLOR_WHITE, "Drug Dealer says: How much rock you gonna sell me?");
					ShowPlayerDialogEx(playerid, DIALOG_CRACK, DIALOG_STYLE_INPUT, "Drug Dealing", "How much crack do you want to sell?", "Submit", "Exit");
				}
				if(listitem == 2) // Start Heroin
				{
					SendClientMessageEx(playerid, COLOR_WHITE, "Drug Dealer says: How much H you got aye?");
					ShowPlayerDialogEx(playerid, DIALOG_HEROIN, DIALOG_STYLE_INPUT, "Drug Dealing", "How much heroin do you want to sell?", "Submit", "Exit");
				}
				if(listitem == 3) // Start Meth
				{
					SendClientMessageEx(playerid, COLOR_WHITE, "Drug Dealer says: How much Meth you got?");
					ShowPlayerDialogEx(playerid, DIALOG_METH, DIALOG_STYLE_INPUT, "Drug Dealing", "How much meth do you want to sell?", "Submit", "Exit");
				}
				if(listitem == 4) // Start Ecstasy
				{
					SendClientMessageEx(playerid, COLOR_WHITE, "Drug Dealer says: How many pills you holding?");
					ShowPlayerDialogEx(playerid, DIALOG_ECSTASY, DIALOG_STYLE_INPUT, "Drug Dealing", "How much ecstasy do you want to sell?", "Submit", "Exit");
				}
			}
		}
		case DIALOG_POT:
		{
			if(response)
			{
				if(!IsNumeric(inputtext))
					return SendClientMessageEx(playerid, COLOR_GREY, "The amount must be numbers.");
				
				if(PlayerInfo[playerid][pDrugs][0] < strval(inputtext))
					return SendClientMessageEx(playerid, COLOR_GREY, "You do not have that much pot.");

				PlayerInfo[playerid][pDrugs][0] -= strval(inputtext);
				new cash = PotPrice1 * strval(inputtext); 
				GivePlayerCash(playerid, cash);
				SendClientMessageEx(playerid, COLOR_WHITE, "Drug Dealer says: Good doing business with ya");

				new str[128];
				format(str, sizeof(str), "You have sold %d grams of pot for $%d.",strval(inputtext), cash);
			    SendClientMessageEx(playerid, COLOR_GRAD1, str);
			}
		}
		case DIALOG_CRACK:
		{
			if(response)
			{
				if(!IsNumeric(inputtext))
					return SendClientMessageEx(playerid, COLOR_GREY, "The amount must be numbers.");
				
				if(PlayerInfo[playerid][pDrugs][1] < strval(inputtext))
					return SendClientMessageEx(playerid, COLOR_GREY, "You do not have that much crack.");

				PlayerInfo[playerid][pDrugs][1]-= strval(inputtext);
				new cash = CrackPrice1 * strval(inputtext); 
				GivePlayerCash(playerid, cash);
				SendClientMessageEx(playerid, COLOR_WHITE, "Drug Dealer says: Good doing business with ya");

				new str[128];
				format(str, sizeof(str), "You have sold %d grams of crack for $%d.",strval(inputtext), cash);
			    SendClientMessageEx(playerid, COLOR_GRAD1, str);
			}
		}
		case DIALOG_HEROIN:
		{
			if(response)
			{
				if(!IsNumeric(inputtext))
					return SendClientMessageEx(playerid, COLOR_GREY, "The amount must be numbers.");
				
				if(PlayerInfo[playerid][pDrugs][4] < strval(inputtext))
					return SendClientMessageEx(playerid, COLOR_GREY, "You do not have that much heroin.");

				PlayerInfo[playerid][pDrugs][4] -= strval(inputtext);
				new cash = HeroinPrice * strval(inputtext); 
				GivePlayerCash(playerid, cash);
				SendClientMessageEx(playerid, COLOR_WHITE, "Drug Dealer says: Good doing business with ya");

				new str[128];
				format(str, sizeof(str), "You have sold %d grams of heroin for $%d.",strval(inputtext), cash);
			    SendClientMessageEx(playerid, COLOR_GRAD1, str);
			}
		}
		case DIALOG_METH:
		{
			if(response)
			{
				if(!IsNumeric(inputtext))
					return SendClientMessageEx(playerid, COLOR_GREY, "The amount must be numbers.");
				
				if(PlayerInfo[playerid][pDrugs][2] < strval(inputtext))
					return SendClientMessageEx(playerid, COLOR_GREY, "You do not have that much meth.");

				PlayerInfo[playerid][pDrugs][2] -= strval(inputtext);
				new cash = MethPrice * strval(inputtext); 
				GivePlayerCash(playerid, cash);
				SendClientMessageEx(playerid, COLOR_WHITE, "Drug Dealer says: Good doing business with ya");

				new str[128];
				format(str, sizeof(str), "You have sold %d grams of meth for $%d.",strval(inputtext), cash);
			    SendClientMessageEx(playerid, COLOR_GRAD1, str);
			}
		}
		case DIALOG_ECSTASY:
		{
			if(response)
			{
				if(!IsNumeric(inputtext))
					return SendClientMessageEx(playerid, COLOR_GREY, "The amount must be numbers.");
				
				if(PlayerInfo[playerid][pDrugs][3] < strval(inputtext))
					return SendClientMessageEx(playerid, COLOR_GREY, "You do not have that much ecstasy.");

				PlayerInfo[playerid][pDrugs][3] -= strval(inputtext);
				new cash = EcstasyPrice * strval(inputtext); 
				GivePlayerCash(playerid, cash);
				SendClientMessageEx(playerid, COLOR_WHITE, "Drug Dealer says: Good doing business with ya");

				new str[128];
				format(str, sizeof(str), "You have sold %d grams of ecstasy for $%d.",strval(inputtext), cash);
			    SendClientMessageEx(playerid, COLOR_GRAD1, str);
			}
		}
	}
	return 1;
}
