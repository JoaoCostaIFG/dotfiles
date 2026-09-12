# Stream32 JSON Status Command — Script Author's Reference

Stream32 is a desktop stream-deck app. A deck key can be configured with a
**JSON status command** provider: the app runs a script on a timer (and again
immediately after the key is pressed), reads one JSON object from its stdout,
and applies it to the key's appearance in real time. The key's **Launch
action** runs the same script without arguments to perform whatever action the
key does (toggle, cycle, add time, etc.).

## The contract

- **Print exactly one JSON object on stdout and exit `0`.** Anything else — a
  non-zero exit code, unparseable output, output over 32 KB, a timeout past 5
  seconds, or a schema-invalid object — is treated as *no answer*: the key
  keeps whatever appearance the user saved until a later check succeeds.
- **Output is never logged.** Nothing the script prints reaches any log file.
- **The script runs through `/bin/sh` on macOS/Linux and `cmd` on Windows**,
  inheriting the desktop app's environment, **not** the user's interactive
  shell environment. On macOS this means a short PATH that excludes
  `/opt/homebrew/bin` and `/usr/local/bin` — write full paths to Homebrew
  tools. On Debian/Ubuntu `/bin/sh` is `dash`, so bash-specific syntax needs
  `bash -c '...'`.
- **Never two runs at once for the same key.** A command slower than its
  interval stretches its own schedule rather than stacking. The whole process
  tree is killed after 5 seconds.
- **Windows console windows are hidden** — no flash on screen.

## The JSON schema

All fields are **optional**. Unknown fields reject the entire answer.

| Field | Type | Constraint | Maps to |
|---|---|---|---|
| `key_color` | string | `#rrggbb`, lowercase hex | Key background color |
| `text_color` | string | `#rrggbb`, lowercase hex | Label text color |
| `label` | string | 1–32 characters | Key label text |
| `icon` | string | Material Symbols icon name (`[a-z0-9_]`, ≤64 chars) | Icon rendered from the built-in library |
| `image` | string | **Slot name** (`[a-z0-9_-]`, ≤32 chars) **or** `data:image/(png\|jpeg\|webp);base64,...` (≤24 KB) | Key artwork |

Rules:
- **`image` outranks `icon`** when both are present; `icon` is not rendered.
- A **slot name** resolves against up to 8 named images the user configured in
  the key editor (uploaded or picked from the icon library). A name the key
  doesn't know is silently dropped — the rest of the answer still applies.
- A **`data:` URL** is artwork the script carries itself (a generated graph, a
  badge). Emit it only when it actually changes — re-encoding an identical
  image with different bytes repaints the key every poll.
- Prefer **slot names** for static custom icons (a few bytes per poll); use
  **`data:` URLs** only for artwork only the script can produce.
- An empty object `{}` is valid and means "no changes" — the key keeps its
  current look.

## Two invocation modes

The user configures two separate command strings on the key:

1. **Launch action** (no `--status` flag): performs the key's action — toggles
   mute, adds a minute, cycles an output, etc. The app re-polls the status
   command immediately after this succeeds, so the press path does not need to
   print JSON (though it may).
2. **Status command** (`--status` or whatever flag the script checks): queried
   on the configured interval. **Must** print the JSON object and exit `0`.

A single script typically handles both:

```sh
#!/bin/sh
if [ "${1:-}" = "--status" ]; then
  # Query only — do not perform the action.
  emit_status
  exit 0
fi

# Press — perform the action.
do_the_thing
emit_status   # optional; the app re-polls --status right after
```

## Practical guidance

- **Use `printf`, not `echo`.** `echo`'s flag handling varies between shells;
  `printf` is portable.
- **Always exit `0`**, even for "idle" or "off" states. Print an idle JSON
  object; never use a non-zero exit to signal "nothing happening."
- **Keep it fast.** Sub-second is ideal. PowerShell costs a few hundred
  milliseconds to start — give PowerShell-based scripts a longer interval (5s+).
- **Write full paths** to any tool not in the system default PATH.
- **Don't write to stderr** (it's ignored, but don't depend on that).
- **Don't daemonize or background** the script — the app waits for it to exit.
- **Prepend a zero-padded seconds field** for countdowns:
  `printf '{"label":"%d:%02d"}\n' "$((rem / 60))" "$((rem % 60))"` → `"4:07"`.
- **Colors use the app's palette convention**: green `#2f8f5b` for active/on,
  red `#8f2f2f` for muted/warning, grey `#37474f` for idle.
- **Common icon names**: `mic`, `mic_off`, `volume_up`, `volume_off`, `timer`,
  `play_circle`, `pause`, `stop`, `power_settings_new`, `bolt`, `wifi`,
  `wifi_off`.

See the scripts in this directory for working examples.

## Quick checklist for a new script

1. Does `--status` always print valid JSON and exit `0`?
2. Does the press path perform the action and exit `0`?
3. Are all field values within their constraints (colors lowercase `#rrggbb`,
   label ≤32 chars)?
4. Are there no unknown fields in the JSON?
5. Does it use `printf` (not `echo`)?
6. Are full paths used for non-standard tools?
7. Is it fast enough for the configured interval?
8. Does a failed query print nothing and exit `0` (rather than guessing)?
