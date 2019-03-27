
# Next-Generation-Gaming-Legacy

How to initiate the SAMP CTL package and download all dependencies

Git Map

* **Master:** this branch serves as the live version of the gamemode and will automatically deploy to the server
* **dev:** this branch is where all upcoming features are merged
* **subsequent branches:** these branches are where new additions are being actively commited to by developers


**MASTER**

    |____dev
        |___new attachment system
        |___hitman update
        |___anti-cheat additions

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
