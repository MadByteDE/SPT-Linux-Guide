
# SPT Lutris installer (Official)

> [!TIP]
> <span style="color:lightgreen">You can use `protonup-qt` to install new wine versions in Lutris!</span>

This *.yml script uses the regular windows installer to install SPT on your system.

## Dependencies

To run the native Linux server you need the following packages installed on your system:

**Ubuntu / Mint**
```
sudo apt install dotnet-runtime-9.0 aspnetcore-runtime-9.0
```

**Fedora / RHEL**
```
sudo dnf install dotnet-runtime-9.0 aspnetcore-runtime-9.0
```

**Arch**
```
sudo pacman -S install dotnet-runtime aspnet-runtime
```

## What you need

- **~120GB free disk space**
- **[Lutris](https://lutris.net/downloads)**
    - Check if GPU and vulkan drivers are installed!
- **[SPT Lutris installer](../../installers/lutris-installer-official.yml) (*.yml)**
- **Wine**: The default wine runner (wine-ge-8-26-x86_64) will not run the `SPTInstaller` executable!
    - We recommend `GE-Proton` for the installation!
- [Cover art](../../docs/lutris/cover_art.md) (Optional)


## Installation

**1. Installing Escape from Tarkov**

First off, you need to install the game. Open Lutris and navigate to the `+` symbol in the top left corner. Select `Search for installer on Lutris website` and search for the game:

<img src="../../media/lutris/tarkov.gif" width="580">

Follow the steps shown inside the application, wait until the installation is finished & install the game client as usual.

> [!IMPORTANT]
> <span style="color:mediumslateblue">**You need to install the game client inside the launcher before continuing with the next step!**


**2. Preparing the wine runner**


Set the **global** `Wine version` to your custom `Wine` build:

<img src="../../media/lutris/wine.jpg" alt="drawing" width="580"/>

Enable `Advanced` settings in the top right, then select `Custom` in the drop-down menu & navigate to the `wine` executable in the extracted Wine directory, e.g. :

        ~/Downloads/wine-10.7-amd64/bin/wine64

Now, save the changes.


**3. Installing SPT**

[Download](../../installers/lutris-installer-official.yml) the installer script.

In Lutris, click the `+` in the top left, select `Install from a local install script` & navigate to the downloaded file:

<img src="../../media/lutris/install_script.jpg" alt="drawing" width="580"/>

Now follow the steps & wait for the installation to complete.

If everything worked you should be able to launch the `SPTarkov - Server`, followed by `SPTarkov - Launcher` & login.

**4. Running SPT**

- Everything now is pretty much done, so now to run the game we need to run the server and the launcher.

- To run the server, run the `SPTarkov.Server.Linux` executable in a terminal.

> [!TIP]
> <span style="color:lightgreen">You can also add the server to Lutris by selecting `Add locally installed game`. Set `Linux` as runner & navigate to the `SPTarkv.Server.Linux` executable in the `Game options`. You need to enable `CLI mode` in the `System options` to run the server in a terminal.</span>

- To run the launcher you just double click the `SPTarkov - Launcher` shortcut in Lutris or press the `Play` button at the bottom.

Have fun!

***
Still having issues? Visit our [issues section](../../docs/issues.md).

***
[Back to landing page](../../README.md)