
# Next-Generation-Gaming-Legacy

**Manual Dependencies**

| Plugin            | Version           | Link  |
| :-------------    |:----:   |----:|
|ZCMD              | v0.3.1            | [Here](https://pastebin.com/raw/SbJc7iXa) |
|Crashdetector     | v4.16             | [Here](https://github.com/Zeex/samp-plugin-crashdetect/releases/tag/v4.16) |
|Discord Connector | v0.2.3            | [Here](https://github.com/maddinat0r/samp-discord-connector/releases/tag/v0.2.3) |
|GVar              | v1.3              | [Here](https://github.com/samp-incognito/samp-gvar-plugin/releases/tag/v1.3)|
|MySQL             | R41-4             | [Here](https://github.com/pBlueG/SA-MP-MySQL/releases/tag/R41-4) |
|Native Checker    | v1.0              | [Here](https://forum.sa-mp.com/showthread.php?t=249226) |
|PAWN Raknet       | v1.2.0            | [Here](https://github.com/urShadow/Pawn.RakNet/releases/tag/1.2.0) |
|SA-MP Compat      | v1.0.1            | [Here](https://github.com/AGraber/samp-compat/releases/tag/1.0.1) |
|SSCANF            | v2.8.3            | [Here](https://github.com/maddinat0r/sscanf/releases/tag/v2.8.3) |
|Streamer          | v2.8.2            | [Here](https://github.com/samp-incognito/samp-streamer-plugin/releases/tag/v2.8.2) |
|Whirlpool         | v1.0              | [Here](https://github.com/Southclaws/samp-whirlpool/releases) |
|BCrypt            | v2.23             | [Here](https://github.com/lassir/bcrypt-samp/releases/tag/v2.2.3) |

---
**SA-MP CTL**
How to initiate the SAMP CTL package and download all dependencies
```python
// download the latest stable SA-MP server files for your OS
sampctl server download 
// downloads all binaries and plugins, and if needed a server.cfg file
sampctl server ensure 
// Ensures dependencies are up to date from pawn.json
sampctl package ensure 
sampctl server run
```
---
**Git Map**

* **Master:** this branch serves as the live version of the gamemode and will automatically deploy to the server
* **dev:** this branch is where all upcoming features are merged
* **subsequent branches:** these branches are where new additions are being actively commited to by developers


**MASTER**

    |____dev
        |___new attachment system
        |___hitman update
        |___anti-cheat additions
---
**How to add new features**
When adding new features, rather than each developer having their own branch - you will create a new branch for the addition and merge it to 'dev' when completed.
When commiting please ensure you follow these simple rules to ensure code is clean and readable.

 - When naming variables we use
   https://en.wikipedia.org/wiki/Hungarian_notation as a global
   convention, for example string would be `szStringName[69];`
   `Float:fPosition[3];` `iVariable;` etc When adding curly brackets please
   maintain the Allman Indentation style
   (https://en.wikipedia.org/wiki/Indentation_style#Allman_style) where
   each bracket has their own line, and doesn't trail.
 - Use whitespace for your code to make it easily readable
 - Comment where applicable to let future developers know the intended
   outcome and usage

```c
CMD:foo(playerid, params[]){
    new stringer[123];
    if(PlayerIsConnected(playerid)){
        format(stringer, sizeof(stringer), "srv: bar");
        SendClientMessage(playerid, COL_GREY, stringer);
        bar(playerid);
    }
    return 1;
}

function bar(playerid){
    SetPVarInt(playerid, "bar", 1);
    return 1;
}
```

## becomes

```c
CMD:foo(playerid, params[])
{
    new szString[123];

    if(PlayerIsConnected(playerid))
    {
        format(szString, sizeof(szString), "SRV: bar();");
        SendClientMessage(playerid, COL_GREY, szString);

        bar(playerid); // Give the player the _bar flag (SetPVarInt)
    }
    return 1;
}

function bar(playerid)
{
    SetPVarInt(playerid, "_bar", 1);

    return 1;
}

```
