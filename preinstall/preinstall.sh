#!/system/bin/sh

MARKER=/data/local/preinstall_done

if [ -f "$MARKER" ]; then
    exit 0
fi

LOGTAG="PreinstallApps"
log -t "$LOGTAG" "Start preinstall"

for apk in /system/preinstall/*.apk; do
    [ -f "$apk" ] || continue
    log -t "$LOGTAG" "Installing $apk"
    pm install --user 0 "$apk"
done

touch "$MARKER"
log -t "$LOGTAG" "Preinstall done"
exit 0

