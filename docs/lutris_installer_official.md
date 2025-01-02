
# SPT Lutris installer (Official)

> [!TIP]
> <span style="color:lightgreen">You can use `protonup-qt` to install new wine versions in Lutris!</span>

This *.yml script uses the regular windows installer to install SPT on your system.

## What you need

- **~100GB free disk space**
- **[Lutris](https://lutris.net/downloads)**
    - Check if you have all your [Wine dependencies](https://github.com/lutris/docs/blob/master/WineDependencies.md) installed.
    - Check if GPU and vulkan drivers are installed!
- **[SPT Lutris installer](../installers/lutris-installer-official.yml) (*.yml)**
- **Wine**: The default wine runner (wine-ge-8-26-x86_64) will not run the `SPTInstaller` executable!
    - We recommend [Kron4ek vanilla wine-9.19-amd64](https://github.com/Kron4ek/Wine-Builds/releases/tag/9.19) for the installation! (can be changed back afterwards)

## Notes

- Sometimes the `Bsg Launcher` can return an error when being closed, resulting in the installation to fail. Make sure to keep all game files when asked by Lutris & retry running the script
- It's possible that the EFT client launches during the installation in the `BSG Launcher`. You can close it e.g. using `Alt+F4` to continue with the installation process


## Installation

1. **Launch `Lutris` and set the **global** `Wine version` to your `Wine` build:**

    <img src="../media/lutris_wine.jpg" alt="drawing" width="580"/>

    - To use a custom Wine version, select `Custom` in the drop-down menu & navigate to the `wine` executable in the extracted Wine directory, e.g. :
    
            ~/Downloads/wine-9.19-amd64/bin/wine64

2. **Run the `SPT Lutris installer` script:**

    <img src="../media/lutris_install_script.jpg" alt="drawing" width="580"/>

3. **Wait until the `BSG Launcher` shows up, → `login`, then either:**

    - press `Download` in the launcher
    
    **OR**
    - Copy/paste an existing **VANILLA** game installation into the prefix, e.g:
        
            /home/USER/Games/escape-from-tarkov/drive_c/Battlestate Games

    - Select `set the path to existing game installation` in the launcher & navigate to the directory by selecting  `My computer` → `C:` → `Battlestate Games` & then the copied game directory.
    - Wait until the file verification is completed

4. **After EFT has been successfully installed, close the `BSG Launcher` to proceed.**
    
5. **Wait until `SPTInstaller` launches, follow the instructions shown & close it when it's done.**

    > [!TIP]
    > <span style="color:lightgreen">For better performance & additional fixes, we recommend using latest [GE-Proton](https://github.com/GloriousEggroll/proton-ge-custom/releases) or `wine-ge-8-26` for playing!</span>

    - If everything worked you should be able to launch the `SPTarkov - Server`, followed by `SPTarkov - Launcher` & login.

    Have fun!

***
Still having issues? Visit our [issues section](../docs/issues.md).

***
[Back to landing page](../README.md)