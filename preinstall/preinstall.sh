#!/system/bin/sh
# One-shot user app preinstaller for X6A
# Installs APKs from /system/etc/preinstall as normal user apps.

set -eu

TAG="x6a-preinstall"
PREINSTALL_DIR="/system/etc/preinstall"
FLAG_FILE="/data/system/.x6a_preinstall.done"

logi() { log -t "$TAG" -p i "$*"; }
loge() { log -t "$TAG" -p e "$*"; }

if [ -f "$FLAG_FILE" ]; then
    logi "preinstall already completed, exiting."
    exit 0
fi

count=0
while ! pm path android >/dev/null 2>&1; do
    if [ "$count" -ge 30 ]; then
        loge "package manager not ready after 30s, aborting."
        exit 1
    fi
    count=$((count + 1))
    sleep 1
done

logi "package manager is ready, scanning $PREINSTALL_DIR"

found=0
for apk in "$PREINSTALL_DIR"/*.apk; do
    [ -f "$apk" ] || continue
    found=1
    basename="$(basename "$apk")"
    logi "installing $basename as user app"

    if pm install -r "$apk" >/dev/null 2>&1; then
        logi "successfully installed $basename"
    else
        loge "failed to install $basename"
    fi
done

if [ "$found" -eq 0 ]; then
    logi "no APKs found in $PREINSTALL_DIR, nothing to do"
fi

mkdir -p "$(dirname "$FLAG_FILE")"
touch "$FLAG_FILE"
chmod 0600 "$FLAG_FILE"
logi "preinstall finished"
exit 0
