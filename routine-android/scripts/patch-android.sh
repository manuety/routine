#!/usr/bin/env bash
# Aggiunge i permessi per notifiche esatte in background al manifest Android.
set -euo pipefail
M="android/app/src/main/AndroidManifest.xml"
test -f "$M" || { echo "Manifest non trovato: $M"; exit 1; }

if grep -q "SCHEDULE_EXACT_ALARM" "$M"; then
  echo "Permessi già presenti."
  exit 0
fi

PERMS='    <uses-permission android:name="android.permission.POST_NOTIFICATIONS" />\n    <uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM" />\n    <uses-permission android:name="android.permission.USE_EXACT_ALARM" />\n    <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED" />\n    <uses-permission android:name="android.permission.VIBRATE" />\n    <uses-permission android:name="android.permission.WAKE_LOCK" />'

sed -i "s#</manifest>#${PERMS}\n</manifest>#" "$M"
grep -q "SCHEDULE_EXACT_ALARM" "$M" && echo "Permessi aggiunti."
