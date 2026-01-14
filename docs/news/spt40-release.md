
## SPT 4.0 has been released! 🎉

[official release announcement](https://github.com/sp-tarkov/build/releases/tag/4.0.0)

And with this *huge* update, there's also some good news for us Linux nerds:

- SPT now ships with a native Linux server ootb!
- The [install guide](https://github.com/zephyrgaldrikian-stack/SPT-Linux-Guide) has been updated!
- The `spt-additions` installer script has been rewritten & learned a couple new tricks:
    - Install EFT/SPT directly using [UMU-Launcher](https://github.com/Open-Wine-Components/umu-launcher) & [GE-Proton](https://github.com/GloriousEggroll/proton-ge-custom) (without Lutris/Bottles)
    - Manage your wine prefix via CLI commands, e.g.:
        - `spt-additions run winetricks win11`
        - `spt-additions run winecfg`
        - `spt-additions env set MANGOHUD=1`
    - For a full list of commands, [get the script](https://github.com/zephyrgaldrikian-stack/SPT-Linux-Guide/blob/main/scripts/spt-additions) & run `spt-additions -h` from a terminal
- Lutris installations now automatically launch & close the server with the launcher!

There also is a [new install method](https://github.com/zephyrgaldrikian-stack/SPT-Linux-Guide/tree/SPTv4-Release?tab=readme-ov-file#overview) available, utilizing the new capabilities of the `spt-additions` script - check it out!

Since SPT 4.0 is a *huuuge* update with a lot of major changes under the hood, there's a couple things worth noting regarding installing & playing it on Linux:

### SPTInstaller (Windows installer)

The new windows installer added a dependency for `Microsoft PowerShell` for creating links of important files in the root directory of the game.

Support for `powershell` through `wine` is limited & might result in the installer failing. If this happens, I'll look into the issue & try to find a solution for it. In the meantime I'd suggest using the native `spt-additions` installer script instead (see above).


### Server mods

The SPT server has been completely rewritten & ported to C#. This means old server mods are no longer compatible with 4.0 & modders have to **completely rewrite** their mods to support the new version.

As Linux is not an officially supported platform for SPT, it's very likely that there'll be server mods that no longer work on Linux. **Please refrain from complaining about this to the mod authors**!

Instead, collect infos/logs about the issue & open a issue report on their mod repository e.g. on Github. You can find a link to the repository on their [Forge](https://forge.sp-tarkov.com/) mod page.

If you're a developer yourself & know C# - I'm sure many mod authors are open for pull requests fixing issues for Linux users. 😉


***
Still having issues? Visit our [issues section](../issues.md).

***

[Back to landing page](../../README.md)
