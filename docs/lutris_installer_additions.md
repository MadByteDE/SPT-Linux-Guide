
# SPT Lutris installer (Additions)

> [!TIP]
> <span style="color:lightgreen">You can use `protonup-qt` to install new wine versions in Lutris! </span>

This *.yml script uses a **custom**, native Linux install script.

You can review the source code [here](../installers/spt-linux-additions).

<details>

**<summary>More details</summary>**

### Why using a custom installer script?

The initial reason for writting the script was to work around issues with the official `SPTInstaller` running through Wine.

There is a bug in most common Wine runners used by `Lutris` or `Bottles` that is causing the patching process to fail randomly. To work around this, the user needs to manually install a custom Wine runner in Lutris and use it globally for the installation.

To get rid of this extra step and also improve on stability and usability, we began experimenting with patching game files on our own using `xdelta3` and the patch files included in the official patcher archive. Later, a custom installation script has been written as well.

### What are the advantages?

- Faster, more stable installation process
- Additional features, e.g.:
    - Native installer & patcher in a single script
    - Support for [reflinking](https://btrfs.readthedocs.io/en/latest/Reflink.html) on supported filesystems (e.g. btrfs)
    - Reinstall mode - creates a backup of user files and reinstalls the latest SPT version
    - **WIP**: Create & restore user backups using CLI commands

### What about disadvantages?

- No standalone GUI - you either have to use the Lutris installer or the CLI to interact with the script.
- No official support on Discord or elsewhere by the mod developers

</details>

## What you need

- **~100GB free disk space**
- **[Lutris](https://lutris.net/downloads)**
    - We recommend using a native Lutris package (not Flatpak/Snap)
        - For Ubuntu-based/Debian-based distros: You can find the latest release *.deb package [here](https://github.com/lutris/lutris/releases)!
    - Check if you have all your [wine dependencies](https://github.com/lutris/docs/blob/master/WineDependencies.md) installed
    - Check if GPU and vulkan drivers are installed
- **[SPT Lutris installer](../installers/lutris-installer-additions.yml) (*.yml)**
    

## Dependencies

#### Ubuntu-based distros
`sudo apt-get install p7zip xxd`

#### Arch-based distros
`sudo pacman -S p7zip xxd`

#### Fedora
`sudo dnf install p7zip-plugins vim-common`

## Notes

- If you have issues with the default wine provided by Lutris, try [Kron4ek vanilla wine-9.19-amd64](https://github.com/Kron4ek/Wine-Builds/releases/tag/9.19) for the installation!
- Sometimes the `Bsg Launcher` can return an error when being closed, resulting in the installation to fail. Make sure to keep all game files when asked by Lutris & retry running the script
- It's possible that the EFT client launches during the installation in the `BSG Launcher`. You can close it e.g. using `Alt+F4` to continue with the installation process


## Installation

1. **Run the `SPT Lutris installer` script:**

    <img src="../media/lutris_install_script.jpg" alt="drawing" width="580"/>

2. **Wait until the `BSG Launcher` shows up, → `login`, then either:**

    - press `Download` in the launcher
    
    **OR**
    - Copy/paste an existing **VANILLA** game installation into the prefix, e.g:
        
            /home/USER/Games/escape-from-tarkov/drive_c/Battlestate Games

    - Select `set the path to existing game installation` in the launcher & navigate to the directory by selecting  `My computer` → `C:` → `Battlestate Games` & then the copied game directory.
    - Wait until the file verification is completed

3. **After EFT has been successfully installed, close the `BSG Launcher` to proceed.**

4. **Wait for the installer script to complete**

    > [!TIP]
    > <span style="color:lightgreen">For better performance & additional fixes, we recommend using latest [GE-Proton](https://github.com/GloriousEggroll/proton-ge-custom/releases) or `wine-ge-8-26` for playing!</span>

    - If everything worked you should be able to launch the `SPTarkov - Server`, followed by `SPTarkov - Launcher` & login.

    Have fun!

***
Still having issues? Visit our [issues section](../docs/issues.md).

***
[Back to landing page](../README.md)