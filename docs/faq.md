# FAQ


## 1. Can I play vanilla EFT on Linux?

The short answer is no.

EFT utilizes BattleEye Anti-cheat software, which works great on Linux. However, game developers have to opt into it manually, and BattleState Games hasn't done so thus far. Since gaming on Linux is still considered niche, it's unlikely that the developers will enable it anytime soon.

Please note that some developers actively prevent users from playing their online games through Proton/Wine by banning accounts if they detect it (e.g [Destiny 2](https://help.bungie.net/hc/en-us/articles/360049517431-Destiny-Account-Restrictions-and-Banning-Policies) → under `Vital information`). It's not known if Battlestate Games is doing this, though.

## 2. Can I play SPT-AKI on Linux?

If your PC meets the minimum [system requirements](https://www.escapefromtarkov.com/support/knowledge/68) for EFT then SPT-AKI should run just fine.

Based on your distribution of choice, you might need to use the terminal to set up the correct packages and drivers used by Wine, Lutris and/or Bottles. Most common steps like installing missing packages should be outlined in your distribution's documentation - just Google it.

If you're running a distribution using an immutable file system, it's important to note that the installation process might differs slightly from our guide due to apps usually being installed in [containers](https://www.redhat.com/en/topics/containers) using Flatpak.

Some distributions tailored specifically for gaming include Nobara, Garuda Linux or Pop!_OS. Those either have most of the needed packages pre-installed or provide scripts / installers to help you with the installation.


## 3. What about the Steam Deck?

It runs, but the overall experience is likely to be suboptimal while playing the game.

For the game to run at acceptable frame rates (like >= 30 FPS), you likely have to sacrifice a lot of visual quality.

EFT is quite hardware demending and the Steam Deck is limited in it's capabilities, especially when using SteamOS. Given the game's high impact on CPU and RAM, occasional lags and slowdowns are to be expected, particularly during NPC spawns or in intense firefights. If you're running Windows, you might gain a couple FPS overall compared to SteamOS.

It's important to note that the installation process on SteamOS differs slightly from our guide due to its immutable file system and apps usually being installed in [containers](https://www.redhat.com/en/topics/containers) using Flatpak.

***

[Back to landing page](../README.md)