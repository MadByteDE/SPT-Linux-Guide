# Downpatching EFT

Whenever Escape from Tarkov receives a new update, SPT has to be updated as well for it to support the latest changes made by Battlestate Games. Since mod development can take some time, you'll need to down patch a copy of the EFT game files to install SPT in the meantime.

We provide two methods to patch the game files on Linux.

## Method 1: Additions script

> [!NOTE]
> <span style="color:lightblue">This script is made by the SPT community & is **NOT** officially supported by the mod developers!</span>

<details>

**<summary>Instructions (click to show)</summary>**

## What you need

- **[Downgrade patcher](https://spt-mirror.refringe.com/patchers/)**
    - Make sure the downgrade patcher matches the installed EFT version!

- **[spt-linux-additions](../installers/spt-linux-additions)**

## Installation

- **1) Move `SPT_Patches` to your install directory**
    - Extract the downgrade patcher archive, then copy and paste the `SPT_Patches` directory to your SPT install directory

- **2) Run the script**
    - Launch a terminal from within the script's directory and run the following command - pointing to the correct SPT install directory, e.g. :

          ./spt-linux-additions patch ~/Games/escape-from-tarkov/drive_c/SPTarkov

        > [!TIP]
        > <span style="color:lightgreen">For more details, run `./spt-linux-additions` without any commands.</span>

</details>

***

## Method 2: Official downgrade patcher

<details>

**<summary>Instructions (click to show)</summary>**

> [!TIP]
> <span style="color:lightgreen">You can use `protonup-qt` to install new wine versions in Lutris / Bottles</span>

## What you need

- **[Downgrade patcher](https://spt-mirror.refringe.com/patchers/)**
    - Make sure the downgrade patcher matches the installed EFT version!

- **Wine**
    - We recommend [Kron4ek wine-10.7-staging-tkg-ntsync-amd64-wow64](https://github.com/Kron4ek/Wine-Builds/releases/tag/10.7) for the installation!


## Installation

- **1) Extract the downloaded downgrade patcher archive**

    > [!TIP]
    > <span style="color:lightgreen">If you get an error about lzma, try `7z` to extract!</span>


- **2) Move the patcher files to your copied EFT game directory, e.g:**

    > [!NOTE]
    > <span style="color:lightblue">`patcher.exe` needs to be inside the root directory alongside the game executable.</span>

    - **Lutris:**

          ~/Games/escape-from-tarkov/drive_c/SPTarkov

    - **Bottles:**

          ~/.var/app/com.usebottles.bottles/data/bottles/bottles/SPTarkov/drive_c/SPTarkov

- **3) Run `patcher.exe`**

    > [!WARNING]
    > <span style="color:khaki">If you get an error on launch, you *might* also need to set no value for  `DOTNET_ROOT` and `DOTNET_BUNDLE_EXTRACT_BASE_DIR` as environment variables:</span>
    > - Bottles: `Settings` → `Environment variables`
    > - Lutris: `Configure` → `System options` → `Environment variables`

    - **Lutris:**

        → Goto `Configure` > `Runner options` > `Wine Version` and set it to the correct Wine version

        → Select one of the previously created shortcuts, click the wine glass icon, → `Open Bash terminal`, and use the following command:

          cd drive_c/SPTarkov/ && wine ./patcher.exe

    - **Bottles:**

        → In `Settings` → `Runner` select the correct Wine version

        → Select `Tools` → `Command Line` and use the following command:

          cd drive_c/SPTarkov/ && ./patcher.exe

        Now wait until the patching is done & voila!

</details>

***
[Back to landing page](../README.md)