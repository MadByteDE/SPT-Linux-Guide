
## Native Server installation using Lutris

> [!WARNING]
> <span style="color:khaki"> If you encounter issues while using / installing the native Linux server, do **NOT** ask the SPT team for support or open a bug report in this repository. You can ask for help in the [SPT on Linux - user discussion thread](https://discord.com/channels/875684761291599922/1258435265664520302) on the [SPT Discord server](https://discord.com/invite/Xn9msqQZan).</span>

> [!NOTE]
> <span style="color:lightblue">Please note that most server mods are primarily made for running on Windows. Some might require additional steps or won't work at all.</span>

After installing SPTarkov using an Lutris installer script, you'll have a single shortcut for both the `SPT.Launcher` & `SPT.Server`. This is due to limitations of Lutris installer scripts. 

That can lead to issues like:

- Terminal windows appear for both the Server **and** the Launcher due to the server requiring `CLI mode` enabled to run through Wine.
- Some popular mods like `Raid Review` might not work due to issues when running through Wine.
- Log messages in the server terminal are not displayed correctly.
- The server process might not close correctly & will stay open in the background.

This guide will describe how to set up & use a native Linux server for SPTarkov to work around those issues.


## What you need

- **[Lutris](https://lutris.net/downloads)**
- **SPT up & running**
    - It's recommended to start with a fresh/unmodded SPT install.
- **Visual Studio (Code/Codium)**
    - Make sure `git` is installed as well!
- **[NVM](https://github.com/nvm-sh/nvm?tab=readme-ov-file#intro)**
- **[SPT Server repository](https://github.com/sp-tarkov/server)**


##  Installation

1. **Building**

    - Follow the instructions to [install NVM](https://github.com/nvm-sh/nvm?tab=readme-ov-file#intro).

    - Prepare the project as described in the [SPT Github repository](https://github.com/sp-tarkov/server?tab=readme-ov-file#installation).

    - Use `CTRL+SHIFT+B` **OR** `Terminal` > `Run Build Task...` & build the project with `npm: build:release - project`. By default this will build the server for the latest SPT release.

2. **Installing**

    If the server built successfully, you'll find it inside the project directory in `project/build`.

    **Note:** The executable will be named `SPT.Server.exe` which is misleading since the file is a native Linux executable. If you want to have the Linux executable alongside the original Windows executable, we'd recommend renaming it to `SPT.Server` (without the file extension).

    - Make the new server executable e.g by running this command in a terminal:

          chmod +x SPT.Server

    - Copy/Move the files from the build directory to your SPTarkov install directory, override when asked.


3. **Setting up the shortcut**

    Almost done. In Lutris, click the `+` in the top left & select `Add locally installed game`:

    - Enter a `Name` & select `Linux` as runner.
    - In `Game options` navigate to the `SPT.Server` Linux executable in your SPTarkov install directory.
    - In `System options` enable `CLI mode` & `save` the changes.

    If everything worked, you should be able to launch the server & play.


***
Still having issues? Visit our [issues section](../../docs/issues.md).

***
[Back to landing page](../../README.md)