# Project Plus Flatpak
## Installing
- Download ProjectPlus3.1.2.flatpak from releases
- Install ProjectPlus3.1.2.flatpak (sudo needed for installing single use Flatpak bundle)
```console
sudo flatpak install ProjectPlus3.1.2.flatpak
```
## Launching
- Launch the ProjectPlus Flatpak (Either search for the app in your menu and click it) or
```console
flatpak run com.projectplusgame.ProjectPlus
```
## Setup
- Set the "Config>Paths>Default ISO:" to your Brawl.iso
- Optionally change graphics options to use fullscreen and set internal resolution higher
- Optionally check "Graphics>Advanced>Load Custom Textures" for HD textures
- Optionally check "Graphics>Advanced>Wait For Prefetch" to reduce stuttering while using HD textures (Causes Dolphin to take longer to close tho)
- Play "Project+ Offline Launcher.dol" for offline play or use "Tools>Start NetPlay..." to either connect or host an online game with the"Project+ Netplay Launcher.dol"
## Uninstalling
- Remove ProjectPlus Flatpak
```console
flatpak remove com.projectplusgame.ProjectPlus
```
## Downloading/Cloning this repo
- Click the green button to download zip and extract once downloaded or clone repo with
```console
git clone --recurse-submodules https://github.com/ChrisHobday/com.projectplusgame.ProjectPlus
```
## Building
- Install Flatpak builder
```console
flatpak install flathub org.flatpak.Builder
```
- Install the platform this Flatpak will be using
```console
flatpak install flathub org.freedesktop.Platform//24.08 org.freedesktop.Sdk//24.08
```
- Build the Flatpak with flatpak-builder (Run this from within the com.projectplusgame.ProjectPlus directory)
```console
flatpak run org.flatpak.Builder --force-clean --repo=repo build-dir com.projectplusgame.ProjectPlus.yml
```
## User installation while building
- Replace last Building step with
```console
flatpak run org.flatpak.Builder --force-clean --repo=repo --user --install build-dir com.projectplusgame.ProjectPlus.yml
```
## Building single use Flatpak bundle like in the releases (After having followed the Building steps above)
- Build the Flatpak bundle (Run this from within the com.projectplusgame.ProjectPlus directory after having followed the Building steps above)
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
- Installation directory             = /var/lib/flatpak/app/com.projectplusgame.ProjectPlus/
- Installation directory (User mode) = ~/.local/share/flatpak/app/com.projectplusgame.ProjectPlus/
- User cache directory               = ~/.var/app/com.projectplusgame.ProjectPlus/cache/
- User config directory              = ~/.var/app/com.projectplusgame.ProjectPlus/config/
- User data directory                = ~/.var/app/com.projectplusgame.ProjectPlus/data/
- SD card                            = ~/.var/app/com.projectplusgame.ProjectPlus/data/FasterPPlus/Wii/sd.raw
- Launcher directory                 = ~/.var/app/com.projectplusgame.ProjectPlus/data/FasterPPlus/Wii/Launcher/