
# SPT Lutris installer (Official)

> [!TIP]
> <span style="color:lightgreen">You can use `protonup-qt` to install new wine versions in Lutris!</span>

This *.yml script uses the regular windows installer to install SPT on your system.

## What you need

- **~100GB free disk space**
- **[Lutris](https://lutris.net/downloads)**
    - Check if you have all your [Wine dependencies](https://github.com/lutris/docs/blob/master/WineDependencies.md) installed.
    - Check if GPU and vulkan drivers are installed!
- **[SPT Lutris installer](../../installers/lutris-installer-official.yml) (*.yml)**
- **Wine**: The default wine runner (wine-ge-8-26-x86_64) will not run the `SPTInstaller` executable!
    - We recommend [Kron4ek vanilla wine-9.19-amd64](https://github.com/Kron4ek/Wine-Builds/releases/tag/9.19) for the installation! (can be changed back afterwards)
- [Cover art](../../docs/lutris/cover_art.md) (Optional)


## Installation

1. **Installing Escape from Tarkov**

    First off, you need to install the game. Open Lutris and navigate to the `+` symbol in the top left corner. Select `Search for installer on Lutris website` and search for the game:

    <img src="../../media/lutris/tarkov.gif" width="580">

    Follow the steps shown inside the application, wait until the installation is finished & install the game client as usual.

> [!IMPORTANT]
> <span style="color:mediumslateblue">**You need to install the game client inside the launcher before continuing with the next step!**


2. **Preparing the wine runner**


    Set the **global** `Wine version` to your custom `Wine` build:

    <img src="../../media/lutris/wine.jpg" alt="drawing" width="580"/>

    Enable `Advanced` settings in the top right, then select `Custom` in the drop-down menu & navigate to the `wine` executable in the extracted Wine directory, e.g. :
    
            ~/Downloads/wine-9.19-amd64/bin/wine64

    Now, save the changes.


3. **Installing SPT**

    [Download](https://github.com/MadByteDE/SPT-Linux-Guide/blob/addon_installer/installers/lutris-installer-official.yml) the installer script.

    In Lutris, click the `+` in the top left, select `Install from a local install script` & navigate to the downloaded file:

    <img src="../../media/lutris/install_script.jpg" alt="drawing" width="580"/>

    Now follow the steps & wait for the installation to complete.

    If everything worked you should be able to launch the `SPTarkov - Server`, followed by `SPTarkov - Launcher` & login.

> [!TIP]
> <span style="color:lightgreen">For better performance & additional fixes, we recommend switching to latest [GE-Proton](https://github.com/GloriousEggroll/proton-ge-custom/releases) or `wine-ge-8-26` for playing!</span>

***
Still having issues? Visit our [issues section](../../docs/issues.md).

***
[Back to landing page](../../README.md)