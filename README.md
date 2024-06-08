# Project Plus Dolphin Flatpak
## Check out releases for instructions to install/setup the Flatpak
## Steps for building the Flatpak
1) Install the following packages (With whatever package manager you use, dnf is used here)
```console
dnf install flatpak flatpak-builder
```
2) Install the platform this Flatpak will be using
```console
flatpak install flathub org.freedesktop.Platform//23.08 org.freedesktop.Sdk//23.08
```
3) Git clone this github (with it's submodules)
```console
git clone --recurse-submodules https://github.com/ChrisHobday/com.projectplusgame.project_plus_dolphin_emulator
```
or Download ZIP with the green button and extract it

4) Build the Flatpak with flatpak-builder (Run this from within the com.projectplusgame.project_plus_dolphin_emulator directory. This will use the yml manifest to make the Flatpak in the created build-dir.)
```console
flatpak-builder --repo=repo --force-clean build-dir com.projectplusgame.project_plus_dolphin_emulator.yml
```

## Steps for installing while building the Flatpak
1) Install the built Flatpak (This will install the Flatpak on your system for the current user.)
```console
flatpak-builder --user --install --force-clean build-dir com.projectplusgame.project_plus_dolphin_emulator.yml
```
2) Check that the Flatpak is listed (It should show up as "project_plus_dolphin_emulator   com.projectplusgame.project_plus_dolphin_emulator".)
```console
flatpak list | grep "project"
```
3) Run the installed Flatpak
```console
flatpak run com.projectplusgame.project_plus_dolphin_emulator
```

## Steps for creating a single use Flatpak bundle like in the releases (After having built already)
1) Build the Flatpak bundle (Run this from within the com.projectplusgame.project_plus_dolphin_emulator directory. This will use the repo to make the Flatpak bundle FasterPPlus.flatpak)
```console
flatpak build-bundle repo FasterPPlus.flatpak com.projectplusgame.project_plus_dolphin_emulator
```

## Steps for Uninstalling/Removing the Flatpak
1) Remove the installed Flatpak
```console
flatpak remove com.projectplusgame.project_plus_dolphin_emulator
```
2) Check that the Flatpak is NOT listed (It should no longer show up.)
```console
flatpak list | grep "project"
```
