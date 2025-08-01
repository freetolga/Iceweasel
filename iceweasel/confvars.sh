#! /bin/sh
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

MOZ_APP_BASENAME=Iceweasel
MOZ_APP_VENDOR=Hyperbola
MOZ_PHOENIX=1
MOZ_AUSTRALIS=1
MC_BASILISK=1
MOZ_UPDATER=
MOZ_BUNDLED_FONTS=1

if test "$MOZ_WIDGET_TOOLKIT" = "windows" -o \
        "$MOZ_WIDGET_TOOLKIT" = "gtk2" -o \
        "$MOZ_WIDGET_TOOLKIT" = "gtk3"; then
  MOZ_BUNDLED_FONTS=1
fi

# For Basilisk we want to use 52.9.YYYY.MM.DD as MOZ_APP_VERSION in release
# builds so add-on developers have something to target while maintaining
# Firefox compatiblity.
# To enable add "export BASILISK_VERSION=1" to the .mozconfig file.
# However, this will cause a full rebuild at 00:00 UTC every day so
# don't export the variable if you are in development or don't care.
#
# Also check if BASILISK_VERSION is equal to something other than 1.
# If equal to something other than 1, then we set the MOZ_APP_VERSION
# to 52.9.BASILISK_VERSION
# When not exported at all we fall back the value in the version*.txt file.
if test -n "$BASILISK_VERSION" ; then
    if [ "$BASILISK_VERSION" = "1" ]; then
        MOZ_APP_VERSION=52.9.2025.07.04
        MOZ_APP_VERSION_DISPLAY=2025.07.04
    else
        MOZ_APP_VERSION=52.9.$BASILISK_VERSION
        MOZ_APP_VERSION_DISPLAY=$BASILISK_VERSION
    fi
else
    MOZ_APP_VERSION=`cat ${_topsrcdir}/$MOZ_BUILD_APP/config/version.txt`
    MOZ_APP_VERSION_DISPLAY=`cat ${_topsrcdir}/$MOZ_BUILD_APP/config/version_display.txt`
fi

MOZ_EXTENSIONS_DEFAULT=" gio"

# MOZ_APP_DISPLAYNAME will be set by branding/configure.sh
# MOZ_BRANDING_DIRECTORY is the default branding directory used when none is
# specified. It should never point to the "official" branding directory.
MOZ_BRANDING_DIRECTORY=iceweasel/branding/iceweasel
MOZ_OFFICIAL_BRANDING_DIRECTORY=iceweasel/branding/iceweasel
MOZ_APP_ID={ec8030f7-c20a-464f-9b0e-13a3a9e97384}
# This should usually be the same as the value MAR_CHANNEL_ID.
# If more than one ID is needed, then you should use a comma separated list
# of values.
ACCEPTED_MAR_CHANNEL_IDS=unofficial,unstable,release
# The MAR_CHANNEL_ID must not contain the following 3 characters: ",\t "
MAR_CHANNEL_ID=unofficial

# Features
MOZ_PROFILE_MIGRATOR=
MOZ_APP_STATIC_INI=1
MOZ_WEBGL_CONFORMANT=1
MOZ_JSDOWNLOADS=1
MOZ_WEBRTC=
MOZ_DEVTOOLS=1
MOZ_SERVICES_COMMON=
MOZ_SERVICES_SYNC=
MOZ_GAMEPAD=
MOZ_AV1=1
MOZ_SECURITY_SQLSTORE=1

if test "$OS_ARCH" = "WINNT" -o \
        "$OS_ARCH" = "Darwin"; then
  MOZ_CAN_DRAW_IN_TITLEBAR=1
fi
