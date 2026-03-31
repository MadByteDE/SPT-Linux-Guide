
## ASP.NET Runtime 9.0

[Website](https://dotnet.microsoft.com/en-us/download/dotnet/9.0)

To run the native Linux server you need to install the native ASP.NET Runtime 9 system package.

## How to install

### Ubuntu / Debian

> [!NOTE]
> On Debian you might need to add the Microsoft package repository first:
```
curl https://packages.microsoft.com/config/debian/13/packages-microsoft-prod.deb -o packages-microsoft-prod.deb
```
```
sudo dpkg -i packages-microsoft-prod.deb
```
```
rm packages-microsoft-prod.deb
```

> [!NOTE]
> On Ubuntu-based distributions you might need to add the `dotnet/backports` PPA:

```
sudo add-apt-repository ppa:dotnet/backports
sudo apt update
```

Now you can install the package:
```
sudo apt-get update && \
sudo apt-get install -y aspnetcore-runtime-9.0
```

### Fedora (based)
```
sudo dnf install aspnetcore-runtime-9.0
```

### Fedora Atomic (e.g. Bazzite/Aurora/Bluefin)
```
rpm-ostree install aspnetcore-runtime-9.0
```

### Arch (based)
```
sudo pacman -S aspnet-runtime-9.0
```

**Nixpkgs (NixOS or Other OS using Nix)**
> [!NOTE]
> This was accurate as of NixOS Stable version `25.05`, and the package name may have changed if using a newer version. Check [Here](https://search.nixos.org/packages?&query=aspnetcore) for the correct package name.

To install system-wide, add `dotnet-aspnetcore_9` to `environment.systempackages` in your `configuration.nix`.

```nix
environment.systemPackages = with pkgs; [
  dotnet-aspnetcore_9
];
```

Similarly, with home-manager, to install for your user only, add `dotnet-aspnetcore_9` to `home.packages` in your `home.nix`.
```nix
home.packages = with pkgs; [
  dotnet-aspnetcore_9
];
```

***
Still having issues? Visit our [issues section](../../docs/issues.md).

***

[Back to landing page](../README.md)
