# FAQ

You can find the official SPT FAQ [here](https://hub.sp-tarkov.com/faq/).

## Table of content

1. [Can I play vanilla EFT on Linux?](#1-can-i-play-vanilla-eft-on-linux)
2. [Can I play SPT on Linux?](#2-can-i-play-spt-on-linux)
3. [What about the Steam Deck?](#3-what-about-the-steam-deck)
4. [My performance is bad, help!](#4-my-performance-is-bad-help)

## 1. Can I play vanilla EFT on Linux?

The short answer is no.

You can play most maps in "offline" PVE if you bought `Edge of Darkness` or the `Unheard` edition. `Streets` will not work since it would still require online services & BSG doesn't support that.

EFT utilizes BattleEye Anti-cheat software, which works great on Linux. However, game developers have to opt into it manually, and BattleState Games hasn't done so thus far. Since gaming on Linux is still considered niche, it's unlikely that the developers will enable it anytime soon.

## 2. Can I play SPT on Linux?

If your PC meets the minimum [system requirements](https://www.escapefromtarkov.com/support/knowledge/68) for EFT then SPT should run just fine.

Based on your distribution of choice, you might need to use the terminal to set up the correct packages and drivers used by Wine, Lutris and/or Bottles. Most common steps like installing missing packages should be outlined in your distribution's documentation - just Google it.

If you're running a distribution using an immutable file system, it's important to note that the installation process might differs slightly from our guide due to apps usually being installed in [containers](https://www.redhat.com/en/topics/containers) using Flatpak.

Some distributions tailored specifically for gaming include Nobara, Garuda Linux or Pop!_OS. Those either have most of the needed packages pre-installed or provide scripts / installers to help you with the installation.


## 3. What about the Steam Deck?

It runs, but the overall experience is likely to be suboptimal while playing the game.

For the game to run at acceptable frame rates (like >= 30 FPS), you likely have to sacrifice a lot of visual quality.

EFT is quite hardware demending and the Steam Deck is limited in it's capabilities, especially when using SteamOS. Given the game's high impact on CPU and RAM, occasional lags and slowdowns are to be expected, particularly during NPC spawns or in intense firefights. If you're running Windows, you might gain a couple FPS overall compared to SteamOS.

It's important to note that the installation process on SteamOS differs slightly from our guide due to its immutable file system and apps usually being installed in [containers](https://www.redhat.com/en/topics/containers) using Flatpak.


## 4. My performance is bad, help!

Before lowering graphics settings in the game, here are some tips on how to improve performance on Linux:

#### 1. Update Kernel
- It's recommended to use the latest available Kernel from your distro's repos.
- If your distro only provides older kernels, consider checking out a rolling-release distro like Manjaro or Garuda instead - effectively trading overall stability for the latest software and best performance.

#### 2. Update GPU drivers
- For best performance, use the latest GPU drivers available
- **For NVIDIA**: Use the latest proprietary driver
- **For AMD**: Make sure Mesa packages are up-to-date

#### 3. Update Wine
- For best performance, search for updated wine builds including `fsync` / `ntsync` and other optimization patchsets, e.g. `GE-Proton`. Easiest way to get new Wine builds is installing them using tools like `protonup-qt`.

#### 4. Use rolling-release distros
- Rolling-release distributions receive the latest packages much faster then fixed or semi-rolling release distros.
- **Be warned**: Having the latest and greatest packages can also come with extra hurdles and instability!

#### 5. GPU bottleneck: Enable DLSS/FSR
- Turning on DLSS/FSR can give you significant performance benefits if you're GPU limited.

#### 6. Tweak mod settings
- Having mods like SAIN, That's Lit, Questing Bots or Looting Bots installed can take a lot of breath out of your system. You can tweak mod settings e.g. reduce total amount of bots spawned or set slower intervals for checks (like bots looking for loot/looking for cover) to get improved performance.

    Check out the mod pages on the [Forge](https://forge.sp-tarkov.com/) to get more details!

***

[Back to landing page](../README.md)