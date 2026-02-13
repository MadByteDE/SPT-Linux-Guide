
## ASP.NET Runtime 9.0

[Website](https://dotnet.microsoft.com/en-us/download/dotnet/9.0)

To run the native Linux server you need to install the native ASP.NET Runtime 9 system package.

## How to install

**Ubuntu / Debian (based)**
Add Microsoft package siging key and add the package repository
```
wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
```
```
sudo dpkg -i packages-microsoft-prod.deb
```
```
rm packages-microsoft-prod.deb
```

Then update and download runtime
```
sudo apt-get update && \
sudo apt-get install -y aspnetcore-runtime-9.0
```

> [!NOTE]
> On some distributions you might need to add the `dotnet/backports` PPA:

```
sudo add-apt-repository ppa:dotnet/backports
sudo apt update
```
**Fedora (based)**
```
sudo dnf install aspnetcore-runtime-9.0
```

**Fedora Atomic (e.g. Bazzite/Aurora/Bluefin)**
```
rpm-ostree install aspnetcore-runtime-9.0
```

**Arch (based)**
```
sudo pacman -S aspnet-runtime-9.0
```

***
Still having issues? Visit our [issues section](../../docs/issues.md).

***

[Back to landing page](../README.md)
