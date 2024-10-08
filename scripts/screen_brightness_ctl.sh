#!/bin/sh
### Sets the brightness of external monitors.
### Just pass the number and it sets the same value on all detected monitors.
### The previous brightness value for each monitor is stored on a cache file and
### can be restored by the `restore` command. The `lower` command sets all monitors
### to a pre-defined low value (default 10).

# cache file
LOCK_FILE="/tmp/screen_brightness.lock"
CACHE_FILE="$HOME/.cache/ddcutil_brightness_restore"
LOW_BRIGHTNESS="10"

set_brightness_task() {
  newBrightness="$1"
  monitorId="$2"

  currentBrightness="$(ddcutil getvcp 10 -d "$monitorId" | grep -o 'current value = *[0-9]*' | grep -o '[0-9]*')"
  # save brightness
  echo "$monitorId-$currentBrightness" >>"$CACHE_FILE"
  # lower brightness
  ddcutil setvcp 10 "$newBrightness" -d "$monitorId"
}

set_brightness() {
  newBrightness="$1"

  # clear cache
  printf "" >"$CACHE_FILE"

  ddcutil detect | grep Display | cut -d' ' -f2 | while read -r monitorId; do
    set_brightness_task "$newBrightness" "$monitorId"
  done
}

# wait pending jobs (acquire lock)
while ! mkdir -- "$LOCK_FILE" >/dev/null 2>&1; do
  sleep 1
done

case "$1" in
"lower")
  set_brightness "$LOW_BRIGHTNESS"
  ;;
"restore")
  while read -r line; do
    monitorId="$(echo "$line" | cut -d'-' -f1)"
    brightness="$(echo "$line" | cut -d'-' -f2)"
    # restore brightness
    ddcutil setvcp 10 "$brightness" -d "$monitorId"
  done <"$CACHE_FILE"
  ;;
[0-9] | [0-9][0-9] | [0-9][0-9][0-9])
  set_brightness "$1"
  ;;
*)
  echo "Unknown command: $1"
  ;;
esac

# release lock
rmdir "$LOCK_FILE"
