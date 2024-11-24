# Troubleshooting

Since there are many different Linux distributions out there, you might encounter issues with your specific installation. This section lists some commonly encountered issues and their solutions.

## Table of content

1. Launcher
    - [1.1 BSG Launcher not rendered correctly (Black window)](#11-bsg-launcher-not-rendered-correctly-black-window)
    - [1.2 Game crashing within seconds after launching](#12-game-crashing-within-seconds-after-launching)
    - [1.3 Missing fonts / icons](#13-missing-fonts--icons)

2. In-Game
    - [2.1 Random crashes while in-raid or hideout](#21-random-crashes-while-in-raid-or-hideout)
    - [2.2 Audio crackling/distortion issues](#22-audio-cracklingdistortion-issues)
    - [2.3 NVIDIA / Wayland: Frozen screen / Black screen](#23-nvidia--wayland-frozen-screen--black-screen)

3. Lutris /  Installer scripts
    - [3.1 Error code 256/512/1280/...](#31-error-code-2565121280)
    - [3.2 Issues on hardware with multiple GPUs (e.g. iGPU / dGPU)](#32-issues-on-hardware-with-multiple-gpus-eg-igpu--dgpu)
    - [3.3 SPT.Server keeps running in the background after closing it](#33-sptserver-keeps-running-in-the-background-after-closing-it)

4. Manual installation
    - [4.1 SPT.Launcher not launching / .NET Desktop Runtime not found](#41-sptlauncher-not-launching--net-desktop-runtime-not-found)
    - [4.2 Error: Failed to create D3D shaders](#42-error-failed-to-create-d3d-shaders)
    - [4.3 SPT.Launcher & SPT.Server won't run at the same time](#43-sptlauncher--sptserver-wont-run-at-the-same-time)


## 1. Launcher

### 1.1 BSG Launcher not rendered correctly (Black window)

**Description**

The BSG Launcher is not rendered correctly, only showing a black window. (Log shows `EGL_NOT_INITIALIZED`).

**Solution**

Usually restarting the launcher (or installation script) "fixes" the issue.

[Back](#table-of-content)

***

### 1.2 Game crashing within seconds after launching

**Description**

After clicking `Play`, the game briefly opens & closes shortly after.

**Solution**

Usually this means the DLL override for `winhttp` is missing!
Manually set `winhttp` to `n,b` in `Configure` > `Runner options` > `DLL Overrides`.

For some users this appearently also happens when using an automated Lutris Installer script, despite the script already adding the override to the prefix (twice actually - into the prefix registry and as environment variable). This appears to be an issue with Lutris or some specific Linux setups.

If the game worked previously & this happens after installing new mods, chances are you're running into issues with the mod(s). Check compatibilty of the mod with other mods as well as the installed SPT version.

[Back](#table-of-content)

***

### 1.3 Missing fonts / icons

**Description**

##### SPT Installer/Launcher

On Linux, the title bar icons will not be displayed by default. That's because the Launcher (as well as the Installer) uses a non-redistributable Microsoft font (Segoe MDL2 Assets - `segmdl2.ttf`).

<img src="../media/issue_icons1.jpg">

**Solution**

You can download & install the Segoe font family on your distribution to get it working correctly. Please check out the included `EULA` as well.

https://aka.ms/SegoeFonts

##### BSG Launcher

To fix fonts in the BSG Launcher, you can download & install the [Bender font](https://www.1001fonts.com/download/bender.zip) (external link, *.zip archive) on your distribution.

[Back](#table-of-content)

## 2. In-game

### 2.1 Random crashes while in-raid or hideout

**Description**

The game crashes while playing a raid or being in the hideout.

**Solution**

This can indicate a problem with Tarkov running into the `vm.max_map_count` limit.

A detailed explaination of what this is can be found [here](https://thelinuxcode.com/using_mmap_function_linux/).

The recommended solution is to raise it to a 'safe' value of `1048576` e.g. by adding:

    vm.max_map_count=1048576

to `/etc/sysctl.conf` and run

    sudo sysctl -p

as stated [here](https://stackoverflow.com/a/50371108).

As of early 2024, [most common distros changed their default value](https://www.gamingonlinux.com/2024/04/arch-linux-changes-vmmax-map-count-to-match-fedora-ubuntu-for-better-gaming/) to the one stated above as well.

[Back](#table-of-content)

***

### 2.2 Audio crackling/distortion issues

**Description**

Sounds in the game are crackling / distorted.

**Solution**

In Lutris on the game shortcut, enable:
- `Configure` → `system options` → `Reduce PulseAudio latency`

That should fix the issue.

[Back](#table-of-content)

***

### 2.3 NVIDIA / Wayland: Frozen screen / Black screen

**Description**

With NVIDIA proprietary drivers on Wayland at Raid-Start or Raid-End the screen freezes. The game is still running in the background (e.g. sounds still play when the mouse hovers UI elements).

**Solution**

This was a bug in NVIDIA drivers prior to version 560 - It's related to high VRAM usage and Wayland. The driver did not fallback to virtual memory / swap whenever the GPUs VRAM was maxed out.

If you check your kernel log with `journalctl -b -r` shortly after it occurs, you'd probably see the following error:

```
Jun 11 19:28:15 kernel: [drm:nv_drm_gem_alloc_nvkms_memory_ioctl [nvidia_drm]] *ERROR* [nvidia-drm] [GPU ID 0x00002600] Failed to allocate NVKMS memory for GEM object
```

We recommend using a Nvidia driver version >= 560 and let the GSP firmware blob **enabled** to fix the issue.

[Back](#table-of-content)


## 3. Lutris installer script

### 3.1 Error code 256/512/1280/...

**Description**

You can get different error codes at different steps throughout the installation process.

**Solution**

It's hard to pinpoint the exact issue since many different apps use the same exit codes and there are many different tasks performed. Try to keep game files and restart the script.

If the error persists after multiple attempts, please [open up a bug report](https://dev.sp-tarkov.com/MadByte/Linux-Guide/issues/new) containing:

- A detailed description of the issue
- The task shown when the error occurs (e.g. "`Installing game dependencies ...`" or "`Launching BSG Launcher ...`")
- If possible, try to take a screenshot or a short video of the issue
- If the Lutris installer fails while showing "`Installing SPT ...`", please attach the `spt-linux-additions.log` log file (usually found inside `~/.cache/spt-linux-additions`) to the bug report

#### Debugging

To get more details if something breaks, you can launch Lutris in debug mode using the following command in a terminal:

#### Native package: 
    lutris -d &> lutris.log
#### Flatpak:
    flatpak run net.lutris.Lutris -d &> lutris.log

This will generate a `lutris.log` file in your current or home directory.

[Back](#table-of-content)

***

### 3.2 Issues on hardware with multiple GPUs (e.g. iGPU / dGPU)

**Description**

The installation fails with the log containing something like:

```
X Error of failed request:  BadMatch (invalid parameter attributes)
  Major opcode of failed request:  156 (NV-GLX)
  Minor opcode of failed request:  43 ()
  Serial number of failed request:  149
  Current serial number in output stream:  150
```

**Solution**

It looks like there is an open [Nvidia/Wine bug report](https://bugs.winehq.org/show_bug.cgi?id=49407) that is working on fixing that issue.

You can try to `disable` your iGPU in your bios settings if possible. The corresponding option often is called `GFX/iGPU Multi-Monitor` or similar.

This should make sure that Lutris is seeing your discrete GPU only.

[Back](#table-of-content)

***

### 3.3 SPT.Server keeps running in the background after closing it

**Description**

When using Lutris 0.5.17 & running the `SPT.Server` via **Proton** (Proton ≠ Wine!), the server will keep running in the background after closing the window.

**Solution**

It's a known bug in Lutris 0.5.17 that has been fixed for the next Lutris update.

In the meantime - as a workaround - you can disable CLI-mode in Lutris **while using Proton**:

- Lutris: `Configure` → `System options` → `cli mode`

This will launch the server in a custom CMD window (without ANSI / colored text support).

Make sure to re-enable this option if you switch back to any Wine runner e.g. `wine-ge`.

[Back](#table-of-content)



## 4. Manual installation

### 4.1 SPT.Launcher not launching / .NET Desktop Runtime not found

**Description**

When launching SPT.Launcher, either one of two issues can occur: 
- A window pop-up appears which says that .NET Desktop Runtime is not installed.
**OR**
- Launcher not coming up and the lutris console log shows a semi-random error code e.g. `40960`

**Solution**

1. Make sure .NET Desktop Runtime 8.0 is installed inside the wine prefix. You should find a `dotnet` folder at `WINEPREFIX/drive_c/Program Files/dotnet/` containing the `dotnet.exe` executable.
2. The system package `dotnet-host` can interfere with the installed dotnet in your prefix. If you don't need this system package for development, remove it and try again.
3. Lastly, you can try to set no value for  `DOTNET_ROOT` and `DOTNET_BUNDLE_EXTRACT_BASE_DIR` in the environment variables for your wine application.

   - Bottles: `Settings` → `Environment variables`
   - Lutris: `Configure` → `System options` → `Environment variables`

[Back](#table-of-content)

***

### 4.2 Error: Failed to create D3D shaders

**Description**

When launching the game using Bottles, it crashes with the log message "Failed to create D3D shaders".

**Solution**

Usually the error indicates that the dependency `d3dcompiler_47` is missing.

Either the bottle is not set up using the `Gaming` preset or Bottles failed to fetch required dependencies (e.g because no internet connection was available).

By default Bottles should install the following dependencies when using the `Gaming` preset:

`d3dx9`, `msls31`, `d3dcompiler_43`, `d3dcompiler_47`, `arial32`, `times32`, `courie32`.

- Make sure all dependencies are listed as installed at the bottom of `Options` → `Dependencies`. If not, install them manually and try again.

***

### 4.3 SPT.Launcher & SPT.Server won't run at the same time

**Description**

When using a Proton runner, only one application can be launched at a time. When trying to launch a second application inside the same prefix, it will quit instantly.

**Solution**

[This is the default behaviour](https://github.com/Open-Wine-Components/umu-launcher/wiki/Frequently-asked-questions-(FAQ)) for running games using Proton. You can override the behaviour by setting the environment variable `PROTON_VERB` to `runinprefix` before running the executable(s):

- Bottles: `Settings` → `Environment variables`
- Lutris: `Configure` → `System options` → `Environment variables`

[Back](#table-of-content)

***

[Up](#table-of-content) | [Back to landing page](../README.md)
