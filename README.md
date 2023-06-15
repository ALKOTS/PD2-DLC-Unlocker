# PD2-DLC-Unlocker
## Installation guide  
Unpack the folder into your /PAYDAY 2/mods/ folder.

# How this works:

##Steam
It creates a steam-dlcs-to-unlock.txt file in the mod folder. By default has a `"*"` in it, which means all dlcs are unlocked. If you want to unlock only specific dlcs, replace the star with dlc ids from [Steam DB](https://steamdb.info/app/218620/dlc/).

# Examples for steam-dlcs-to-unlock.txt:

## Unlock all heists post white house:

2074240  
1945681  
1906240  
1778790  
1654480  
1449450  
1347750  
1252200  
1184411  
1555040  
2215010  

## Unlock all characters:

337661  
338951  
344140  
374301  
384020  
450660  
468410  
548422  
758420  

##EGS
It creates a epic-dlcs-to-unlock.txt file in the mod folder. By default has a `"*"` in it, which means all dlcs are unlocked. If you want to unlock only specific dlcs, replace the star with dlc names from debug.txt. Dlc ids can be found on [Steam DB](https://steamdb.info/app/218620/dlc/).

# Examples for epic-dlcs-to-unlock.txt:

## Unlock all heists post white house:

trai
ranc  
pent  
chca  
sand  
fex  
pex  
bex  
mex  
chas  
corp  

## Unlock all characters:

character_pack_clover
hl_miami
character_pack_dragan
character_pack_sokol
hlm2_deluxe
dragon
chico
opera
wild
ecp
john_wick_character

## Hide from anticheat mods:
While using most of the content you dont own will get you marked as cheater, simply having this installed doesn't get you flagged by the game, however anticheat mods will detect it, so its better to rename the folder and the lua file and change the name and scriptpath in mod.txt
