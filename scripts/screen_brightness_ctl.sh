#!/bin/sh

# cache file
LOCK_FILE="/tmp/screen_brightness.lock"
CACHE_FILE="$HOME/.cache/ddcutil_brightness_restore"
LOW_BRIGHTNESS="10"

# wait pending jobs (acquire lock)
while ! mkdir -- "$LOCK_FILE" >/dev/null 2>&1; do
  sleep 1
done

case "$1" in
"lower")
  # clear cache
  printf "" >"$CACHE_FILE"

  ddcutil detect | grep Display | cut -d' ' -f2 | while read -r monitorId; do
    currentBrightness="$(ddcutil getvcp 10 -d "$monitorId" | grep -o 'current value = *[0-9]*' | grep -o '[0-9]*')"
    # save brightness
    echo "$monitorId-$currentBrightness" >>"$CACHE_FILE"
    # lower brightness
    ddcutil setvcp 10 "$LOW_BRIGHTNESS" -d "$monitorId"
  done
  ;;
"restore")
  while read -r line; do
    monitorId="$(echo "$line" | cut -d'-' -f1)"
    brightness="$(echo "$line" | cut -d'-' -f2)"
    # restore brightness
    ddcutil setvcp 10 "$brightness" -d "$monitorId"
  done <"$CACHE_FILE"
  ;;
*)
  echo "Unknown command: $1"
  ;;
esac

# release lock
rmdir "$LOCK_FILE"
