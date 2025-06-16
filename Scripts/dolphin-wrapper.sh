#!/bin/sh

# Setup Discord rich presence
echo "Setting up Discord rich presence"
for i in {0..9}; do
    test -S $XDG_RUNTIME_DIR/discord-ipc-$i ||
    ln -sf {app/com.discordapp.Discord,$XDG_RUNTIME_DIR}/discord-ipc-$i;
done

# This is a bit of a hacky way to get the sd.raw, Launcher directory, and patched Dolphin.ini/GFX.ini into the Flatpak user var directory, because the installation directory for Flatpaks is not writable and so we cannot use portable.txt + the User directory beside the binary
echo "Make directory /var/data/FasterPPlus/Wii (~/.var/app/com.projectplusgame.ProjectPlus/data/FasterPPlus/Wii) if it doesn't exist"
mkdir -p /var/data/FasterPPlus/Wii

echo "Make directory /var/config/FasterPPlus/ (~/.var/app/com.projectplusgame.ProjectPlus/config/FasterPPlus) if it doesn't exist"
mkdir -p /var/config/FasterPPlus

# Create and set variables for the system and user SD card creation dates
SystemSDCardCreationDate=`stat --format="%W" /app/share/ishiiruka/sys/Wii/sd.raw`
UserSDCardCreationDate=`stat --format="%W" /var/data/FasterPPlus/Wii/sd.raw`

# Check if the system SD card creation date is newer than the user SD card creation date (There has been an update), or there is no user SD card
echo "Checking if there is a newer SD card version"
if [ $SystemSDCardCreationDate -gt ${UserSDCardCreationDate:=0} ];
then
    # Copy newer SD card to user data directory
    echo "Copying newer SD card to user data directory"
    cp /app/share/ishiiruka/sys/Wii/sd.raw /var/data/FasterPPlus/Wii/sd.raw
else
    echo "SD card is already at latest version"
fi

echo "Copy /app/share/ishiiruka/sys/Wii/Launcher (/var/lib/flatpak/app/com.projectplusgame.ProjectPlus/current/active/files/share/ishiiruka/sys/Wii/Launcher) to /var/data/FasterPPlus/Wii (~/.var/app/com.projectplusgame.ProjectPlus/data/FasterPPlus/Wii) if it doesn't already exist"
cp -nr /app/share/ishiiruka/sys/Wii/Launcher /var/data/FasterPPlus/Wii

echo "Copy user config /app/share/ishiiruka/user/Config/Dolphin.ini and GFX.ini (/var/lib/flatpak/app/com.projectplusgame.ProjectPlus/current/active/files/share/ishiiruka/user/Config/Dolphin.ini) to /var/config/FasterPPlus/Dolphin.ini and GFX.ini (~/.var/app/com.projectplusgame.ProjectPlus/config/FasterPPlus/Dolphin.ini and GFX.ini) if they don't already exist"
cp -n /app/share/ishiiruka/user/Config/Dolphin.ini /var/config/FasterPPlus/Dolphin.ini
cp -n /app/share/ishiiruka/user/Config/GFX.ini /var/config/FasterPPlus/GFX.ini

# Create and set variables for the system and user HD textures creation dates
SystemHDTexturesCreationDate=`stat --format="%W" /app/share/ishiiruka/user/Load/Textures/RSBE01`
UserHDTexturesCreationDate=`stat --format="%W" /var/data/FasterPPlus/Load/Textures/RSBE01`

# Check if the system HD textures creation date is newer than the user HD textures creation date (There has been an update), or there is no user HD textures
echo "Checking if there are newer HD textures"
if [ $SystemHDTexturesCreationDate -gt ${UserHDTexturesCreationDate:=0} ];
then
    # Make /var/data/FasterPPlus/Load/Textures directory if it doesn't exist
    echo "Make directory /var/data/FasterPPlus/Load/Textures (~/.var/app/com.projectplusgame.ProjectPlus/data/FasterPPlus/Load/Textures) if it doesn't exist"
    mkdir -p /var/data/FasterPPlus/Load/Textures
    # Copy newer HD textures to user data directory
    echo "Copying newer HD textures to user data directory"
    cp -r /app/share/ishiiruka/user/Load/Textures/RSBE01 /var/data/FasterPPlus/Load/Textures
else
    echo "HD textures are already at latest version"
fi

# Launch ishiiruka binary
ishiiruka "$@"