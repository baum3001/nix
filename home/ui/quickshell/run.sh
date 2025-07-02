#!/usr/bin/env bash

# System tray dbus property errors
DBUS='quickshell.dbus.properties.warning = false;quickshell.dbus.dbusmenu.warning = false'
# Notification server warnings on reload
NOTIFS='quickshell.service.notifications.warning = false'
# StatusNotifierItem warnings on reload
SNI='quickshell.service.sni.host.warning = false'
# Long running processes on reload
PROCESS='QProcess: Destroyed while process'
# Image cache warning
CACHE="Cannot open: file://$XDG_CACHE_HOME/caelestia/imagecache/"

qs -p "$(dirname "$0")" --log-rules "$DBUS;$NOTIFS;$SNI" | grep -vF -e "$PROCESS" -e "$CACHE"
