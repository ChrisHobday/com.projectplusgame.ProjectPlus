#!/bin/sh

# Setup Discord rich presence
echo "Setting up Discord rich presence"
for i in {0..9}; do
    test -S $XDG_RUNTIME_DIR/discord-ipc-$i ||
    ln -sf {app/com.discordapp.Discord,$XDG_RUNTIME_DIR}/discord-ipc-$i;
done

# This is a bit of a hacky way to get the SD card, Launcher directory, and patched Dolphin.ini/GFX.ini into the Flatpak user var directory, because the installation directory for Flatpaks is not writable and so we cannot use portable.txt + the User directory beside the binary
echo "Make directory /var/data/dolphin-emu/Wii if it doesn't exist"
mkdir -p /var/data/dolphin-emu/Wii

echo "Make directory /var/config/dolphin-emu if it doesn't exist"
mkdir -p /var/config/dolphin-emu

# Create and set variables for the system and user SD card creation dates
SystemSDCardCreationDate=`stat --format="%W" /app/share/dolphin-emu/sys/Wii/sd.raw`
UserSDCardCreationDate=`stat --format="%W" /var/data/dolphin-emu/Load/WiiSD.raw`

# Check if the system SD card creation date is newer than the user SD card creation date (There has been an update), or there is no user SD card
echo "Checking if there is a newer SD card version"
if [ $SystemSDCardCreationDate -gt ${UserSDCardCreationDate:=0} ];
then
    # Copy newer SD card to user data directory
    echo "Copying newer SD card to user data directory"
    cp /app/share/dolphin-emu/sys/Wii/sd.raw /var/data/dolphin-emu/Load/WiiSD.raw
else
    echo "SD card is already at latest version"
fi

echo "Copy /app/share/dolphin-emu/sys/Wii/Launcher to /var/data/dolphin-emu/Wii if it doesn't already exist"
cp -nr /app/share/dolphin-emu/sys/Wii/Launcher /var/data/dolphin-emu/Wii

echo "Copy user config /app/share/dolphin-emu/user/Config/Dolphin.ini and GFX.ini to /var/config/dolphin-emu/Dolphin.ini and GFX.ini if they don't already exist"
cp -n /app/share/dolphin-emu/user/Config/Dolphin.ini /var/config/dolphin-emu/Dolphin.ini
cp -n /app/share/dolphin-emu/user/Config/GFX.ini /var/config/dolphin-emu/GFX.ini

# Create and set variables for the system and user HD textures creation dates
SystemHDTexturesCreationDate=`stat --format="%W" /app/share/dolphin-emu/user/Load/Textures/RSBE01`
UserHDTexturesCreationDate=`stat --format="%W" /var/data/dolphin-emu/Load/Textures/RSBE01`

# Check if the system HD textures creation date is newer than the user HD textures creation date (There has been an update), or there is no user HD textures
echo "Checking if there are newer HD textures"
if [ $SystemHDTexturesCreationDate -gt ${UserHDTexturesCreationDate:=0} ];
then
    # Make /var/data/dolphin-emu/Load/Textures directory if it doesn't exist
    echo "Make directory /var/data/dolphin-emu/Load/Textures if it doesn't exist"
    mkdir -p /var/data/dolphin-emu/Load/Textures

    # Copy newer HD textures to user data directory
    echo "Copying newer HD textures to user data directory"
    cp -r /app/share/dolphin-emu/user/Load/Textures/RSBE01 /var/data/dolphin-emu/Load/Textures
else
    echo "HD textures are already at latest version"
fi

# Launch dolphin
dolphin-emu "$@"