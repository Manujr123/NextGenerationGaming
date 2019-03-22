/*
    	 		 /$$   /$$  /$$$$$$          /$$$$$$$  /$$$$$$$
				| $$$ | $$ /$$__  $$        | $$__  $$| $$__  $$
				| $$$$| $$| $$  \__/        | $$  \ $$| $$  \ $$
				| $$ $$ $$| $$ /$$$$ /$$$$$$| $$$$$$$/| $$$$$$$/
				| $$  $$$$| $$|_  $$|______/| $$__  $$| $$____/
				| $$\  $$$| $$  \ $$        | $$  \ $$| $$
				| $$ \  $$|  $$$$$$/        | $$  | $$| $$
				|__/  \__/ \______/         |__/  |__/|__/

//--------------------------------[DISCORD.PWN]--------------------------------


 * Copyright (c) 2018, Next Generation Gaming, LLC
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
 
 //--------------------------------[ INITIATE/EXIT ]---------------------------

stock SendDiscordMessage(channel, message[]) {
	new DCC_Channel:ChannelId;
	switch(channel) {
		// admin-chat
		case 0: {
			//432448034258026497
			ChannelId = DCC_FindChannelById("432448034258026497");
			DCC_SendChannelMessage(ChannelId, message);
		}
		// admin-warnings
		case 1: {
			//432456347997437952
			ChannelId = DCC_FindChannelById("432456347997437952");
			DCC_SendChannelMessage(ChannelId, message);
		}
		// Head Admin
		case 2: {
			//432447907984310273
			ChannelId = DCC_FindChannelById("432447907984310273");
			DCC_SendChannelMessage(ChannelId, message);

		}
		// #server-errors
		case 3: {
			//432456150143729674
			ChannelId = DCC_FindChannelById("432456150143729674");
			DCC_SendChannelMessage(ChannelId, message);
		}
		// #server-chat
		case 4: {
			//447977057209679893
			ChannelId = DCC_FindChannelById("447977057209679893");
			DCC_SendChannelMessage(ChannelId, message);
		}
		// #sa-mp-ooc-chat
		case 5: {
			//537887476103249920
			ChannelId = DCC_FindChannelById("537887476103249920");
			DCC_SendChannelMessage(ChannelId, message);
		}
		// IG Announcements
		case 6: {
			//546587111516536832
			ChannelId = DCC_FindChannelById("546587111516536832");
			DCC_SendChannelMessage(ChannelId, message);
		}
		// IG Advertisements
		case 7: {
			//546596009304784897
			ChannelId = DCC_FindChannelById("546596009304784897");
			DCC_SendChannelMessage(ChannelId, message);
		}
		// /newb and /ca requests 
		case 8: { 
			//546599295235653633
			ChannelId = DCC_FindChannelById("546599295235653633");
			DCC_SendChannelMessage(ChannelId, message);
		}
	}
	return 1;
}

public DCC_OnChannelMessage(DCC_Channel:channel, DCC_User:author, const message[]) 
{
	if(!author) return 1;
	if(!channel) return 1;
	new channel_name[32], name[46], szMessage[128];
	DCC_GetChannelName(channel, channel_name);
	DCC_GetUserName(author, name);
	for(new i=0; i < strlen(name); ++i)
	{
		{
			switch(name[i])
			{
				case 'a'..'z','A'..'Z', '0'..'9','-','_','@','.',',','[',']','{','}','"','!','£','$','^','&','*','+', '/','#','>','<', ' ', ':': continue; 
				default: return false;
			}
		}
	}
	if(strcmp(channel_name, "") || strcmp(channel_name, " "))
	{
		for(new i=0; i < strlen(message); ++i)
		{
			{
				switch(message[i])
				{
					case 'a'..'z','A'..'Z', '0'..'9','-','_','@','.',',','[',']','{','}','"','!','£','$','^','&','*','+', '/','#','>','<', ' ', ':': continue; 
					default: return false;
				}
			}
			if(strfind(message, "UPDATE", true) != -1 || strfind(message, "SELECT", true) != -1 || strfind(message, "DROP", true) != -1 || strfind(message, "INSERT", true) != -1 || strfind(message, "SLEEP", true) != -1)
			{
				format(szMessage, sizeof(szMessage), "Potential SQL query attempted (Author: %s Channel: %s)", name, channel_name); 
				SendDiscordMessage(1, szMessage);
				return false;
			}
		}
		printf("[DCC] OnChannelMessage (Channel %s): Author %s sent message: %s", channel_name, name, message);
		if(!strcmp(channel_name, "admin-chat", true) && strcmp(name, "SA-MP", true)) 
		{
			format(szMessage, sizeof(szMessage), "* [Discord] Administrator %s: %s", name, message);
			StripColorEmbedding(szMessage);
			foreach(new i: Player)
				{
					if(PlayerInfo[i][pAdmin] >= 2)
					{
						SendClientMessage(i, COLOR_YELLOW, szMessage);
					}
				}
		}
		if(!strcmp(channel_name, "head-admin-chat", true) && strcmp(name, "SA-MP", true)) 
		{
			format(szMessage, sizeof(szMessage), "* [Discord] Administrator %s: %s", name, message);
			StripColorEmbedding(szMessage);
			foreach(new i: Player)
				{
					if(PlayerInfo[i][pAdmin] >= 1337)
					{
						SendClientMessage(i, COLOR_GREEN, szMessage);
					}
				}
		}
/*
		if(!strcmp(channel_name, "newb", true) && strcmp(name, "SA-MP", true)) 
		{
			new fpos = strfind(message, "-");
			new id[6];
			strmid(id, message, 0, fpos);
			new playerid = strval(id);
			format(szMessage, sizeof(szMessage), "%s", message);
			StripColorEmbedding(szMessage);
			DiscordAnswerNewbie(name, playerid, szMessage, fpos);
		}
		if(!strcmp(channel_name, "sa-mp-ooc-chat", true) && strcmp(name, "SA-MP", true)) 
		{
			format(szMessage, sizeof(szMessage), "(( [Discord] %s: %s ))", name, message);
			StripColorEmbedding(szMessage);
			foreach(new i: Player)
			{
				if(!gOoc[i]) 
				{
					SendClientMessage(i, COLOR_OOC, szMessage);
				}
			}
		}
*/
	}
	return 1;
}
