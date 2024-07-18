#!/bin/sh
### switch the default sink (audio output) to next one available
### Selects by ID and wrap-around

set -eu

exec 9>/tmp/next_sink_lock
while ! flock -n 9; do
  echo 'Another instance is running. Waiting...'
  sleep 1
done

set_first_available_sink() {
  pactl set-default-sink "$(pactl -f json list sinks | jq -r 'first(.[] | .index)')"
}

defaultSinkIndex="$(pactl -f json list sinks | jq -r ".[] | select(.name == \"$(pactl get-default-sink)\") | .index")"
if [ -z "$defaultSinkIndex" ]; then
  # no current sink, set first available
  set_first_available_sink
else
  # go to next sink
  nextSinkIndex="$(pactl -f json list sinks | jq -r "first(.[] | select(.index > ${defaultSinkIndex}) | .index)")"
  if [ -z "$nextSinkIndex" ]; then
    # wrap around
    set_first_available_sink
  else
    pactl set-default-sink "$nextSinkIndex"
  fi
fi
