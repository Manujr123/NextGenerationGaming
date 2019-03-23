#define DIALOG_REFUNDPROCESS_1 22000
#define DIALOG_REFUNDPROCESS_2 22001
#define DIALOG_REFUNDPROCESS_3 22002
#define DIALOG_REFUNDPROCESS_4 22003
#define DIALOG_REFUNDPROCESS_5 22004
#define DIALOG_REFUNDPROCESS_6 22005


#include <YSI\y_hooks>

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_REFUNDPROCESS_1)
    {
        if(!response) return 1;
        if(response)
        {
            ShowPlayerDialogEx(playerid, DIALOG_REFUNDPROCESS_2, DIALOG_STYLE_INPUT, "Refund - Username", 
            "Please enter the username of the account.\
            \n\n{FF0000}NOTE: You will need to include the '_' character in between the first and last name.", 
            "Continue", "Cancel");
        }
    }
    if(dialogid == DIALOG_REFUNDPROCESS_2)
    {
        if(!response)
        {
            ShowPlayerDialogEx(playerid, DIALOG_REFUNDPROCESS_1, DIALOG_STYLE_MSGBOX, "Refund - The Process", 
            "Once you proceed from this screen you will be prompted to login with your OLD credentials (this will either be from Next Generation Gaming or New Generation Gaming).\
            \n\nIf your details are valid a request to get all your stats transferred will be sent to administrators who will review it.\
            \n\nIf you follow this process and get denied yet have further proof to confirm account ownership we suggest you take it to TeamSpeak or the forums.\
            \n\nOnce your request is approved your stats will be added automatically and won't matter if you're online/offline.\
            \n\n\n{FF0000}NOTE: Under no normal circumstances are we resetting the password for old Next Generation Gaming/New Generation Gaming accounts.", 
            "Continue", "Cancel");
        }
        if(response)
        {
            if(PlayerInfo[playerid][pRefundAttempts] >= 5) 
            {
                SendClientMessageEx(playerid, COLOR_GRAD2, "You're blocked from submitting refund requests.");
                return 1;
            }
            if(IsValidName(inputtext))
            {
                SetPVarString(playerid, "RefundUsername", inputtext);
                ShowPlayerDialogEx(playerid, DIALOG_REFUNDPROCESS_3, DIALOG_STYLE_PASSWORD, "Refund - Password", 
                "Please enter the password of the account.", 
                "Continue", "Cancel");
            }
            else
            {
                ShowPlayerDialogEx(playerid, DIALOG_REFUNDPROCESS_2, DIALOG_STYLE_INPUT, "Refund - Username", 
                "Please enter the username of the account.\
                \n\n{FF0000}NOTE: You will need to include the '_' character in between the first and last name.\
                \n\nERROR: Invalid roleplay name.", 
                "Continue", "Cancel");
            }
        }
    }
    if(dialogid == DIALOG_REFUNDPROCESS_3)
    {
        if(!response)
        {
            ShowPlayerDialogEx(playerid, DIALOG_REFUNDPROCESS_2, DIALOG_STYLE_INPUT, "Refund - Username", 
            "Please enter the username of the account.\
            \n\n{FF0000}NOTE: You will need to include the '_' character in between the first and last name.", 
            "Continue", "Cancel");
            DeletePVar(playerid, "RefundUsername");
        }
        if(response)
        {
            new pwdBuffer[129], usrBuffer[MAX_PLAYER_NAME], szQuery[256];
            WP_Hash(pwdBuffer, sizeof(pwdBuffer), inputtext);
            GetPVarString(playerid, "RefundUsername", usrBuffer, MAX_PLAYER_NAME);
            format(szQuery, sizeof(szQuery), "SELECT * FROM `accounts_old` WHERE `Username` = '%s' AND `Key` = '%s'", usrBuffer, pwdBuffer);
            mysql_tquery(MainPipeline, szQuery, "OnRefundLookup", "d", playerid);
        }
    }
    if(dialogid == DIALOG_REFUNDPROCESS_5)
    {
        if(!response) return 1;
        if(response)
        {
            new fpos = strfind(inputtext, ":");
            new szUsername[MAX_PLAYER_NAME];
            strmid(szUsername, inputtext, 0, fpos);
            new szQuery[96];
            SetPVarString(playerid, "Admin_RefundUsername", szUsername);
            format(szQuery, sizeof(szQuery), "SELECT * FROM `accounts` WHERE `Username` = '%s'", szUsername);
            mysql_tquery(MainPipeline, szQuery, "OnRefundUserSelected", "d", playerid);
        }
    }
    if(dialogid == DIALOG_REFUNDPROCESS_6)
    {
        if(!response)
        {
            new szQuery[96], usrBuffer[MAX_PLAYER_NAME];
            GetPVarString(playerid, "Admin_RefundUsername", usrBuffer, MAX_PLAYER_NAME);
            format(szQuery, sizeof(szQuery), "UPDATE `accounts` SET `Refund` = '3' WHERE `Username` = '%s'", usrBuffer);
            mysql_tquery(MainPipeline, szQuery, "OnRefundDenied", "d", playerid);
        }
        if(response)
        {
            new szQuery[96], usrBuffer[MAX_PLAYER_NAME];
            GetPVarString(playerid, "RefundName", usrBuffer, MAX_PLAYER_NAME);
            format(szQuery, sizeof(szQuery), "SELECT * FROM `accounts_old` WHERE `Username` = '%s'", usrBuffer);
            mysql_tquery(MainPipeline, szQuery, "OnRefundApproved", "d", playerid);
        }
    }
    return 1;
}

CMD:requestrefund(playerid, params[])
{
    if(PlayerInfo[playerid][pRefund]) return SendClientMessageEx(playerid, COLOR_GRAD2, "Your refund is either complete or in progress.");
    if(PlayerInfo[playerid][pRefundAttempts] >= 5) 
    {
        SendClientMessageEx(playerid, COLOR_GRAD2, "You're blocked from submitting refund requests.");
        return 1;
    }
    ShowPlayerDialogEx(playerid, DIALOG_REFUNDPROCESS_1, DIALOG_STYLE_MSGBOX, "Refund - The Process", 
    "Once you proceed from this screen you will be prompted to login with your OLD credentials (this will either be from Next Generation Gaming or New Generation Gaming).\
    \n\nIf your details are valid a request to get all your stats transferred will be sent to administrators who will review it.\
    \n\nIf you follow this process and get denied yet have further proof to confirm account ownership we suggest you take it to TeamSpeak or the forums.\
    \n\nOnce your request is approved your stats will be added automatically and won't matter if you're online/offline.\
    \n\n\n{FF0000}NOTE: Under no normal circumstances are we resetting the password for old Next Generation Gaming/New Generation Gaming accounts.", 
    "Continue", "Cancel");
    return 1;
}

forward OnRefundDenied(playerid);
public OnRefundDenied(playerid)
{
    if(cache_affected_rows())
    {
        new usrBuffer[MAX_PLAYER_NAME], tmpUsername[MAX_PLAYER_NAME];
        GetPVarString(playerid, "RefundName", usrBuffer, MAX_PLAYER_NAME);
        GetPVarString(playerid, "Admin_RefundUsername", tmpUsername, MAX_PLAYER_NAME);
        szMiscArray[0] = 0;
        format(szMiscArray, sizeof(szMiscArray), "%s has approved a refund for %s (from account %s)", GetPlayerNameEx(playerid), tmpUsername, usrBuffer);
	    Log("logs/refund.log", szMiscArray);
        SendClientMessageEx(playerid, COLOR_GRAD2, "You have denied the refund request.");
        DeletePVar(playerid, "RefundName");
        DeletePVar(playerid, "Admin_RefundUsername");
        DeletePVar(playerid, "RefundIP");
    }
    else return SendClientMessageEx(playerid, COLOR_GRAD2, "Refund status failed to update, contact tech.");
    return 1;
}

forward OnRefundApproved(playerid);
public OnRefundApproved(playerid)
{
    new rows;
    cache_get_row_count(rows);
    if(rows)
    {
        new tmpLevel, tmpHours, tmpCash, tmpBalance, 
        tmpDetSkill, tmpSexSkill, tmpBoxSkill, tmpLawSkill, tmpMechSkill, tmpTruckSkill, tmpArmsSkill, tmpSmugglerSkill, tmpFishSkill, tmpPhoneNr;
        cache_get_value_name_int(0,  "Level", tmpLevel);
        cache_get_value_name_int(0,  "ConnectedTime", tmpHours);
        cache_get_value_name_int(0,  "Money", tmpCash);
        cache_get_value_name_int(0,  "Bank", tmpBalance);
        cache_get_value_name_int(0,  "DetSkill", tmpDetSkill);
        cache_get_value_name_int(0,  "SexSkill", tmpSexSkill);
        cache_get_value_name_int(0,  "BoxSkill", tmpBoxSkill);
        cache_get_value_name_int(0,  "LawSkill", tmpLawSkill);
        cache_get_value_name_int(0,  "MechSkill", tmpMechSkill);
        cache_get_value_name_int(0,  "TruckSkill", tmpTruckSkill);
        cache_get_value_name_int(0,  "DrugSmuggler", tmpSmugglerSkill);
        cache_get_value_name_int(0,  "ArmsSkill", tmpArmsSkill);
        cache_get_value_name_int(0,  "FishSkill", tmpFishSkill);
        cache_get_value_name_int(0,  "PhoneNr", tmpPhoneNr);

        new giveplayerid, usrBuffer[MAX_PLAYER_NAME];
        GetPVarString(playerid, "Admin_RefundUsername", usrBuffer, MAX_PLAYER_NAME);
		giveplayerid = ReturnUser(usrBuffer);
		if(giveplayerid != INVALID_PLAYER_ID)  //user online, issue refund
        {
            if(gPlayerLogged{giveplayerid} == 0) return SendClientMessageEx(playerid, COLOR_GRAD2, "Player isn't logged in yet, please try again in a moment.");
            PlayerInfo[giveplayerid][pLevel] += tmpLevel-1; // -1 to account for the level 1 they'll have by default
            PlayerInfo[giveplayerid][pConnectHours] += tmpHours;
            GivePlayerCashEx(playerid, TYPE_BANK, tmpCash + tmpBalance);
            PlayerInfo[giveplayerid][pDetSkill] += tmpDetSkill;
            PlayerInfo[giveplayerid][pSexSkill] += tmpSexSkill;
            PlayerInfo[giveplayerid][pBoxSkill] += tmpBoxSkill;
            PlayerInfo[giveplayerid][pLawSkill] += tmpLawSkill;
            PlayerInfo[giveplayerid][pMechSkill] += tmpMechSkill;
            PlayerInfo[giveplayerid][pTruckSkill] += tmpTruckSkill;
            PlayerInfo[giveplayerid][pDrugSmuggler] += tmpSmugglerSkill;
            PlayerInfo[giveplayerid][pArmsSkill] += tmpArmsSkill;
            PlayerInfo[giveplayerid][pFishingSkill] += tmpFishSkill;
            PlayerInfo[giveplayerid][pPnumber] = tmpPhoneNr;
            PlayerInfo[giveplayerid][pRefund] = 3;
            SendClientMessageEx(playerid, COLOR_GRAD2, "Refund successfully approved and issued.");
            SendClientMessageEx(giveplayerid, COLOR_PINK, "Your refund has been issued, please confirm everything is correct on /stats!");
        }
        else //user offline, issue refund via database
        {
            szMiscArray[0] = 0;
            format(szMiscArray, sizeof(szMiscArray), "UPDATE `accounts` SET `Level` += '%d', `ConnectedTime` += '%d', `Bank` += '%d', `DetSkill` += '%d', `SexSkill` += '%d', `BoxSkill` += '%d', \
            `LawSkill` += '%d', `MechSkill` += '%d', `TruckSkill` += '%d', `DrugSmuggler` += '%d', `ArmsSkill` += '%d', `FishSkill` += '%d', `PhoneNr` = '%d', `Refund` = '2' WHERE `Username` = '%s'", 
            tmpLevel-1, tmpHours, tmpCash + tmpBalance, tmpDetSkill, tmpSexSkill, tmpBoxSkill, tmpLawSkill, tmpMechSkill, tmpTruckSkill, tmpSmugglerSkill, tmpArmsSkill, tmpFishSkill, tmpPhoneNr, usrBuffer);
            mysql_tquery(MainPipeline, szMiscArray, "OnIssueRefund", "d", playerid);
        }
    }
    else return SendClientMessageEx(playerid, COLOR_GRAD2, "Unable to find account, error.");
    return 1;
}

forward OnRefundUserSelected(playerid);
public OnRefundUserSelected(playerid)
{
    new row;
    cache_get_row_count(row);
    if(row)
    {
        new tmpUsername[MAX_PLAYER_NAME], tmpIP[24], szQuery[96];

        cache_get_value_name(0, "RefundName", tmpUsername, MAX_PLAYER_NAME);
        cache_get_value_name(0, "IP", tmpIP, 24);

        SetPVarString(playerid, "RefundName", tmpUsername);
        SetPVarString(playerid, "RefundIP", tmpIP);

        format(szQuery, sizeof(szQuery), "SELECT `IP` FROM `accounts_old` WHERE `Username` = '%s'", tmpUsername);
        mysql_tquery(MainPipeline, szQuery, "OnOldAccountLookup", "d", playerid);
    }
    else return SendClientMessageEx(playerid, COLOR_GRAD2, "Account not found, unknown error.");
    return 1;
}

forward OnOldAccountLookup(playerid);
public OnOldAccountLookup(playerid)
{
    new row;
    cache_get_row_count(row);
    if(row)
    {
        new tmpUsername[MAX_PLAYER_NAME], tmpIP[24], tmpRefundUsername[MAX_PLAYER_NAME], tmpRefundIP[24], tmpCountry1[64], tmpCountry2[64], tmpCity1[64], tmpCity2[64];
        GetPVarString(playerid, "Admin_RefundUsername", tmpUsername, MAX_PLAYER_NAME);
        GetPVarString(playerid, "RefundName", tmpRefundUsername, MAX_PLAYER_NAME);
        GetPVarString(playerid, "RefundIP", tmpIP, 24);
        cache_get_value_name(0, "IP", tmpRefundIP, 24);
        GetIPCountry(tmpIP, tmpCountry1, sizeof(tmpCountry1));
        GetIPCity(tmpIP, tmpCity1, sizeof(tmpCity1));
        GetIPCountry(tmpRefundIP, tmpCountry2, sizeof(tmpCountry2));
        GetIPCity(tmpRefundIP, tmpCity2, sizeof(tmpCity2));
        szMiscArray[0] = 0;
        format(szMiscArray, sizeof(szMiscArray), 
        "Username\tIP\tRefund Username\tRefund IP\n%s\t%s (%s, %s)\t%s\t%s (%s, %s)", 
        tmpUsername, tmpIP, tmpCity1, tmpCountry1, tmpRefundUsername, tmpRefundIP, tmpCity2, tmpCountry2);

        ShowPlayerDialog(playerid, DIALOG_REFUNDPROCESS_6, DIALOG_STYLE_TABLIST_HEADERS, "Refund - Review", szMiscArray, "Accept", "Deny");
    }
    else return SendClientMessageEx(playerid, COLOR_GRAD2, "Account not found, unknown error.");
    return 1;
}

forward OnIssueRefund(playerid);
public OnIssueRefund(playerid)
{
    if(cache_affected_rows())
    {
        SendClientMessageEx(playerid, COLOR_GRAD2, "Refund successfully approved and issued.");
        new szQuery[96], usrBuffer[MAX_PLAYER_NAME], tmpUsername[MAX_PLAYER_NAME];
        GetPVarString(playerid, "RefundName", usrBuffer, MAX_PLAYER_NAME);
        GetPVarString(playerid, "Admin_RefundUsername", tmpUsername, MAX_PLAYER_NAME);
        szMiscArray[0] = 0;
        format(szMiscArray, sizeof(szMiscArray), "%s has approved a refund for %s (from account %s)", GetPlayerNameEx(playerid), tmpUsername, usrBuffer);
	    Log("logs/refund.log", szMiscArray);
        format(szQuery, sizeof(szQuery), "UPDATE `accounts_old` SET `Redeemed` = '1' WHERE `Username` = '%s'", usrBuffer);
        mysql_tquery(MainPipeline, szQuery, "OnRefundFinish", "d", playerid);
        
    }
    else return SendClientMessageEx(playerid, COLOR_GRAD2, "Unknown error when issuing refund.");
    return 1;
}

forward OnRefundFinish(playerid);
public OnRefundFinish(playerid)
{
    if(cache_affected_rows())
    {
        DeletePVar(playerid, "RefundName");
        DeletePVar(playerid, "Admin_RefundUsername");
        DeletePVar(playerid, "RefundIP");
    }
    else return SendClientMessageEx(playerid, COLOR_GRAD2, "Refund failed to finish properly, contact tech.");
    return 1;
}

forward OnRefundLookup(playerid);
public OnRefundLookup(playerid)
{
    new rows;
    cache_get_row_count(rows);
    printf("%d", rows);
    if(rows)
    {
        new redeemed, szQuery[96];
        cache_get_value_name_int(0, "Redeemed", redeemed);
        if(redeemed == 1) return SendClientMessageEx(playerid, COLOR_GRAD2, "This account has already been issued as a refund, if this is your account contact a member of tech/security.");
        new usrBuffer[MAX_PLAYER_NAME];
        GetPVarString(playerid, "RefundUsername", usrBuffer, MAX_PLAYER_NAME);
        PlayerInfo[playerid][pRefund] = 1;
        format(PlayerInfo[playerid][pRefundAccount], MAX_PLAYER_NAME, "%s", usrBuffer);
        SendClientMessageEx(playerid, COLOR_GRAD2, "Your refund request has been successfully processed, an administrator will review it soon.");
        format(szQuery, sizeof(szQuery), "UPDATE `accounts` SET `Refund` = '1', `RefundName` = '%s' WHERE `Username` = '%s'", GetPlayerNameExt(playerid), PlayerInfo[playerid][pRefundAccount]); //manually set it on the database so /refunds updates w/o having to relog
        mysql_tquery(MainPipeline, szQuery, "OnQueryFinish", "i", SENDDATA_THREAD);
        DeletePVar(playerid, "RefundUsername");
    }
    else
    {
        PlayerInfo[playerid][pRefundAttempts]++;
        DeletePVar(playerid, "RefundUsername");
        ShowPlayerDialogEx(playerid, DIALOG_REFUNDPROCESS_2, DIALOG_STYLE_INPUT, "Refund - Username", 
        "Please enter the username of the account.\
        \n\n{FF0000}NOTE: You will need to include the '_' character in between the first and last name.\
        \n\nERROR: Invalid login credentials, a total of 5 invalid logins will lock you from refunding.", 
        "Continue", "Cancel");
    }
    return 1;
}

CMD:refunds(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
    {
        new szQuery[96];
        format(szQuery, sizeof(szQuery), 
        "SELECT `Username`, `IP`, `RefundName` FROM `accounts` WHERE `Refund` = 1"); 
        mysql_tquery(MainPipeline, szQuery, "OnRefundSearch", "d", playerid);
    }
    else return SendClientMessageEx(playerid, COLOR_GREY, "You are not authorised to use this command");
    return 1;
}

forward OnRefundSearch(playerid);
public OnRefundSearch(playerid)
{
    new rows, usrResult[MAX_PLAYER_NAME], rfdUsrResult[MAX_PLAYER_NAME];
    szMiscArray[0] = 0;
    cache_get_row_count(rows);
    format(szMiscArray, sizeof(szMiscArray), "Username\tRefund Username");
    for(new row; row < rows; row++)
    {
        cache_get_value_name(row, "Username", usrResult, MAX_PLAYER_NAME);
        cache_get_value_name(row, "RefundName", rfdUsrResult, MAX_PLAYER_NAME);
        format(szMiscArray, sizeof(szMiscArray), "%s\n%s:\t%s", szMiscArray, usrResult, rfdUsrResult);
    }
    ShowPlayerDialogEx(playerid, DIALOG_REFUNDPROCESS_5, DIALOG_STYLE_TABLIST_HEADERS, "Active Refund Requests", szMiscArray, "Confirm", "Cancel");
    return 1;
}