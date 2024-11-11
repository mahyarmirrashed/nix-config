# :snowflake: Nix Configuration

This repository contains Nix configurations for my various devices.

## Device Naming Convention

Devices are named according to their Pantheon.

1. **Linux Workstations**: Greek mythology;
2. **Linux Servers**: Greek letters;
3. **Linux Edge**: Roman mythology; and
4. **Darwin/MacOS**: Norse mythology.

## Development

To check changes during development, `nix flake check` can be used.

### Custom Library

All custom/reusable functions are located in [./lib](./lib). They are hoisted as
`custom.<path>` thanks to [Haumea](https://github.com/nix-community/haumea).
This means that a path like `./lib/utils/windowManager.nix` can be accessed via
`custom.utils.windowManager` in the NixOS and Home Manager modules.
