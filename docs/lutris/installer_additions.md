
# SPT Lutris installer (Additions)


This *.yml script uses a **custom**, native Linux install script.

You can review the source code [here](../../installers/spt-linux-additions).

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

To run the native Linux server you need the following packages installed on your system:

- **~120GB free disk space**

- **[SPT Lutris installer](../../installers/lutris-installer-additions.yml) (*.yml)**

- [Cover art](../../docs/lutris/cover_art.md) (Optional)

- **Ubuntu / Mint**
    ```
    sudo apt install dotnet-runtime-9.0 aspnetcore-runtime-9.0
    ```

- **Fedora / RHEL**
    ```
    sudo dnf install dotnet-runtime-9.0 aspnetcore-runtime-9.0
    ```

- **Arch**
    ```
    sudo pacman -S install dotnet-runtime aspnet-runtime
    ```

## Installation

**1. Installing Escape from Tarkov**

First off, you need to install the game. Open Lutris and navigate to the `+` symbol in the top left corner. Select `Search for installer on Lutris website` and search for the game:

<img src="../../media/lutris/tarkov.gif" width="580">

Follow the steps shown inside the application, wait until the installation is finished & install the game client as usual.

> [!IMPORTANT]
> <span style="color:mediumslateblue">**You need to install the game client inside the launcher before continuing with the next step!**


**2. Installing SPT**

[Download](../../installers/lutris-installer-additions.yml) the installer script.

In Lutris, click the `+` in the top left, select `Install from a local install script` & navigate to the downloaded file:

<img src="../../media/lutris/install_script.jpg" alt="drawing" width="580"/>

Now follow the steps & wait for the installation to complete.

**3. Running SPT**

- Everything now is pretty much done, so now to run the game we need to run the server and the launcher.

- To run the server, run the `SPTarkov.Server.Linux` executable in a terminal.

> [!TIP]
> <span style="color:lightgreen">You can add the server to Lutris by selecting `Add locally installed game`. Set `Linux` as runner & navigate to the `SPTarkv.Server.Linux` executable in the `Game options`. You need to enable `CLI mode` in the `System options` to run the server in a terminal.</span>

- To run the launcher you just double click the `SPTarkov - Launcher` shortcut in Lutris or press the `Play` button at the bottom.

Have fun!

***
Still having issues? Visit our [issues section](../../docs/issues.md).

***
[Back to landing page](../../README.md)