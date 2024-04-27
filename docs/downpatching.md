# Downpatching EFT

Whenever Escape from Tarkov receives a new update, SPT-AKI has to be updated as well for it to support the latest changes made by Battlestate Games. Since mod development can take some time, you'll need to downpatch a copy of the EFT game files to install SPT in the meantime.

We provide two methods to patch the game files on Linux.

## Method 1: Official AKI Patcher

<details>

**<summary>Instructions (click to show)</summary>**

### What you need

- [AKIPatcher](https://hub.sp-tarkov.com/files/file/204-aki-patcher/#versions)
    - 
    - Make sure to get the correct `AKIPatcher` for your EFT and SPT-AKI version!

- [Wine-Staging-SPT build](https://dev.sp-tarkov.com/MadByte/Linux-Guide/releases) (*.tar.xz)
    -
    - install instructions can be found in the description on the `Releases` page.

### Installation

- (1) Extract the downloaded `AKIPatcher` archive
    -
    > If you get an error about lzma, try `7z` to extract!

- (2) Move the patcher files to your copied EFT game directory, e.g:
    -
    > `patcher.exe` must be inside the root directory alongside the game executable.

    - **Lutris:**

          ~/Games/escape-from-tarkov/drive_c/SPTarkov

    - **Bottles:**

          ~/.var/app/com.usebottles.bottles/data/bottles/bottles/SPTarkov/drive_c/SPTarkov

- (3) Run `patcher.exe`
    -
    > Selecting another runner is a temporary workaround required for `AKIPatcher` to not fail while applying patches on some systems. This step can be reverted after the installation is completed.

    - **Lutris:**

        → Set the `Wine Version` for the prefix to the new `Wine-Staging-SPT` runner

        → Select one of the previously created shortcuts, click the wine glass icon, → `Open Bash terminal`, and use the following command:

          cd drive_c/SPTarkov/ && wine ./patcher.exe

    - **Bottles:**

        → In `Settings` → `Runner` select the new `Wine-Staging-SPT` runner

        → Select `Tools` → `Command Line` and use the following command:

          cd drive_c/SPTarkov/ && ./patcher.exe

    Now wait until the patching is done & voila!

</details>

## Method 2: Linux Patcher script

❗ <span style="color:tomato">This script is made by the SPT-AKI community & is NOT officially supported by the mod developers!</span> ❗

<details>

**<summary>Instructions (click to show)</summary>**

### What you need

- [AKIPatcher](https://hub.sp-tarkov.com/files/file/204-aki-patcher/#versions)
    - 
    - Make sure to get the correct `AKIPatcher` for your EFT and SPT-AKI version!

- [spt-linux-additions script](../installers/spt-linux-additions)
    -


### Usage

- (1) Install `Aki_Patches` to your game directory
    - 
    - Extract the `AKIPatcher` files, then copy and paste the `Aki_Patches` directory to the your SPT install directory

- (2) Run the script
    -
    - Launch a terminal from within the script's directory and run the following command - pointing to the correct SPT install directory, e.g.

            ./spt-linux-additions patch -R ~/Games/escape-from-tarkov/drive_c/SPTarkov
         > For more details, run `./spt-linux-additions` without any commands.

</details>

## Why is there an unofficial patcher script?

The initial reason for writting the script was to work around issues with the official `AKI Patcher` running through `Wine`.

There is a bug in most common `Wine` runners used by `Lutris` or `Bottles` that causes the patching to fail randomly. After some digging it turned out that there's one particular patch in `wine-staging` that causes this issue, so we compiled our own version of `Wine` without this patchset. It can be found in the `Releases` section of this repo.

To get rid of the extra step of installing a custom `Wine` runner on your system, we've began experimenting with patching game files on our own using `xdelta3` and the patch files included in the official patcher archive.

### Advantages:

- Patching can be almost twice as fast when `xdelta3` is running natively
- Patches don't necessarily need to be located inside the game directory (optional `SOURCE` argument)
- More helpful debug output possible (`--debug` or `--verbose` option set)
- The script can do more then just patching game files! (more info coming soon)

***
[Back to landing page](../README.md)