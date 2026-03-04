# Downpatching EFT

Whenever Escape from Tarkov receives a new update, SPT has to be updated as well for it to support the latest changes made by Battlestate Games. Since mod development can take some time, you'll need to down patch a copy of the EFT game files to install SPT in the meantime.

We provide two methods to patch the game files on Linux.

## Method 1: Additions script

> [!NOTE]
> This script is made by the SPT community & is **NOT** officially supported by the mod developers!

### What you need

- **[Downgrade patcher](https://mirror.spt.dev/patchers/)**
    - Make sure the downgrade patcher matches the installed EFT version!

- **[spt-additions](../scripts/spt-additions)**

### Installation

- **1) Download the [spt-additions](../scripts/spt-additions) script**
    - Then, launch a terminal from within the script's directory & make the script executable:

          chmod +x ./spt-additions

- **2) Move `SPT_Patches` to your install directory**
    - Extract the downgrade patcher archive, then copy and paste the `SPT_Patches` directory to your SPT install directory

- **3) Run the script**
    -  Now run the script with the `patch` command pointing to your SPT install directory, e.g. :

           ./spt-additions patch ~/Games/escape-from-tarkov/drive_c/SPTarkov

> [!TIP]
> For more details, run `./spt-additions help patch`.


## Method 2: Official downgrade patcher

### What you need

> [!TIP]
> You can use [ProtonPlus](https://flathub.org/apps/com.vysp3r.ProtonPlus) or [ProtonUp-qt](https://davidotek.github.io/protonup-qt/) to install new wine versions in Lutris!

- **[Downgrade patcher](https://mirror.spt.dev/patchers/)**
    - Make sure the downgrade patcher matches the installed EFT version!

- **Wine**
    - Tested wine versions:
        - **[wine-kron4ek-10.16 amd64](https://github.com/Kron4ek/Wine-Builds/releases/tag/10.16)**
        - **[wine-tkg-git (Valve Bleeding Edge)](https://github.com/Frogging-Family/wine-tkg-git/actions/workflows/wine-valvexbe.yml)**

### Installation

- **1) Extract the downloaded downgrade patcher archive**

> [!TIP]
> If you get an error about lzma, try `7z` to extract!


- **2) Move the patcher files to your copied EFT game directory, e.g:**

> [!NOTE]
> `patcher.exe` needs to be inside the root directory alongside the game executable.

- **Lutris:**

        ~/Games/escape-from-tarkov/drive_c/SPTarkov

- **Bottles:**

        ~/.var/app/com.usebottles.bottles/data/bottles/bottles/SPTarkov/drive_c/SPTarkov

- **3) Run `patcher.exe`**

> [!WARNING]
> If you get an error on launch, you *might* also need to set no value for  `DOTNET_ROOT` and `DOTNET_BUNDLE_EXTRACT_BASE_DIR` as environment variables:
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

***

[Back to landing page](../README.md)