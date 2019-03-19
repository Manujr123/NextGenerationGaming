/*
    	 		 /$$   /$$  /$$$$$$          /$$$$$$$  /$$$$$$$
				| $$$ | $$ /$$__  $$        | $$__  $$| $$__  $$
				| $$$$| $$| $$  \__/        | $$  \ $$| $$  \ $$
				| $$ $$ $$| $$ /$$$$ /$$$$$$| $$$$$$$/| $$$$$$$/
				| $$  $$$$| $$|_  $$|______/| $$__  $$| $$____/
				| $$\  $$$| $$  \ $$        | $$  \ $$| $$
				| $$ \  $$|  $$$$$$/        | $$  | $$| $$
				|__/  \__/ \______/         |__/  |__/|__/
//--------------------------------[SOCKET.PWN]--------------------------------
                                Created by JCurtis
 * Copyright (c) 2016, New Generation Gaming, LLC
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

new Socket:nggSocket;

hook OnGameModeInit() {
    ListenToSocket(nggSocket, SOCKET_LPORT);
}

hook OnGameModeExit() {
    DestroySocket(nggSocket);
}

ListenToSocket(Socket:socket, port)
{
    new string[256];
    socket = socket_create(TCP);

    if(!is_socket_valid(socket)) return print("Invalid Socket!");

    socket_set_max_connections(socket, MAX_SOCKET_CONNECTIONS);
    socket_listen(socket, port);
    format(string, sizeof(string), "[SOCKET] Houston we are a go, Socket is being listened on port %d with %d max connections", port, MAX_SOCKET_CONNECTIONS);
    print(string);
    return 1;
}

DestroySocket(Socket:socket)
{
    socket_stop_listen(socket);
	socket_destroy(socket);
    print("Socket destroyed.");
    return 1;
}

public onSocketRemoteConnect( Socket:id, remote_client[], remote_clientid )
{
	//Check if socket belongs to us.
    new string[256];
    format(string, sizeof(string), "[SOCKET] incoming connection from IP: %s Client ID: %d", remote_client, remote_clientid);
    Log("logs/socket.log", string);
    print(string);
	return 1;
}

public onSocketReceiveData( Socket:id, remote_clientid, data[], data_len )
{
    // Validate the data sent by the socket.
    if(id == nggSocket)
    {
        if(strfind(data, CP_SOCKET_TOKEN, false) != -1)
        {
            if(strfind(data, "kick", false) != -1)
            {
                new str[1024], strDest[3][33];
                sscanf(data, "p<|>s[32]s[32]s[32]", strDest[0], strDest[1], strDest[2]);
                format(str, sizeof(str), "%s | %s | %s | %s", strDest[0], strDest[1], strDest[2]);
                new giveplayerid;
                giveplayerid = ReturnUser(strDest[2]);
                if(giveplayerid != INVALID_PLAYER_ID)
                {
                    new playerip[32], string[256];
                    GetPlayerIp(giveplayerid, playerip, sizeof(playerip));
                    format(string, sizeof(string), "AdmCmd: %s(%d) (IP:%s) was kicked by the UCP, reason: Unspecified.", GetPlayerNameEx(giveplayerid), GetPlayerSQLId(giveplayerid), playerip);
                    Log("logs/kick.log", string);
                    format(string, sizeof(string), "AdmCmd: %s was kicked by the UCP, reason: Unspecified.", GetPlayerNameEx(giveplayerid));
                    SendClientMessageToAllEx(COLOR_LIGHTRED, string);
                    StaffAccountCheck(giveplayerid, GetPlayerIpEx(giveplayerid));
                    SetTimerEx("KickEx", 1000, 0, "i", giveplayerid);
                    if(GetPVarType(giveplayerid, "RepFam_TL")) Rivalry_Toggle(giveplayerid, false);
                }
            }
            if(strfind(data, "slap", false) != -1)
            {
                new strDest[3][33];
                sscanf(data, "p<|>s[32]s[32]s[32]s[32]", strDest[0], strDest[1], strDest[2]);
                new giveplayerid;
                giveplayerid = ReturnUser(strDest[2]);
                new szString[128], Float:posx, Float:posy, Float:posz, Float:shealth;
                GetHealth(giveplayerid, shealth);
                SetHealth(giveplayerid, shealth-5);
                GetPlayerPos(giveplayerid, posx, posy, posz);
                SetPlayerPos(giveplayerid, posx, posy, posz+5);
                PlayerPlaySound(giveplayerid, 1130, posx, posy, posz+5);
                format(szString, sizeof(szString), "AdmCmd: %s was slapped by someone on the UCP.", GetPlayerNameEx(giveplayerid));
                ABroadCast(COLOR_LIGHTRED, szString, 2);
            }

        }
        else
        {
            new string[256], ip[64];
            get_remote_client_ip(nggSocket, remote_clientid, ip);
            format(string, sizeof(string), "[SOCKET] Someone just tried sending data with wrong auth token IP: %s Client ID: %d, data: %s, length: %d", ip, remote_clientid, data, data_len);
            Log("logs/socket.log", string);
            print(string);
        }
    }
	return 1;
}

public onSocketRemoteDisconnect( Socket:id, remote_clientid )
{
    if(id == nggSocket)
    {
        new string[256], ip[64];
        get_remote_client_ip(nggSocket, remote_clientid, ip);
        format(string, sizeof(string), "nggSocket SOCKET: IP: %s Client %d has disconnected.", ip, remote_clientid);
        Log("logs/socket.log", string);
    }
	return 1;
}