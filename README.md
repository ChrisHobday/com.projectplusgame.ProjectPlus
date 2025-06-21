# Project Plus Flatpak (Unofficial)
## Installing
- Download ProjectPlus3.1.2.flatpak from releases
- Install ProjectPlus3.1.2.flatpak (sudo needed for installing single use Flatpak bundle)
```console
flatpak install --user ProjectPlus3.1.2.flatpak
```
## Running
```console
flatpak run com.projectplusgame.ProjectPlus
```
## Setup
- Set the "Config>Paths>Default ISO:" to your Brawl.iso
- Optionally change graphics options to use fullscreen and set internal resolution higher
- Optionally check "Graphics>Advanced>Load Custom Textures" for HD textures
- Optionally check "Graphics>Advanced>Wait For Prefetch" to reduce stuttering while using HD textures (Causes Dolphin to take longer to close tho)
- Play "Project+ Offline Launcher.dol" for offline play or use "Tools>Start NetPlay..." to either connect or host an online game with the"Project+ Netplay Launcher.dol"
## Removing
```console
flatpak remove com.projectplusgame.ProjectPlus
```
## Building
> **_NOTE:_**  With org.flatpak.Builder, org.kde.Sdk and org.kde.Platform installed.
```console
flatpak run org.flatpak.Builder build-dir --repo=repo --force-clean com.projectplusgame.ProjectPlus.yml
```
```console
flatpak build-bundle repo ProjectPlus3.1.2.flatpak com.projectplusgame.ProjectPlus
```
## Troubleshooting
- Check if Flatpak is installed
```console
flatpak list | grep ProjectPlus
```
- Enter Flatpak in command line mode
```console
flatpak run --command=sh com.projectplusgame.ProjectPlus
```
- Fix white screen at startup
```console
rm -r ~/.var/app/com.projectplusgame.ProjectPlus/cache/
```
## Flatpak locations
- Installation directory (User mode) = ~/.local/share/flatpak/app/com.projectplusgame.ProjectPlus/
- User cache directory               = ~/.var/app/com.projectplusgame.ProjectPlus/cache/
- User config directory              = ~/.var/app/com.projectplusgame.ProjectPlus/config/
- User data directory                = ~/.var/app/com.projectplusgame.ProjectPlus/data/
- SD card                            = ~/.var/app/com.projectplusgame.ProjectPlus/data/dolphin-emu/Load/WiiSD.raw
- Launcher directory                 = ~/.var/app/com.projectplusgame.ProjectPlus/data/dolphin-emu/Wii/Launcher/
