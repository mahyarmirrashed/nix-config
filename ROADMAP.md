# Configuration Roadmap

Eventually, our Nix repository will look like this. All in due time.

## Directory Structure

```txt
.
├── docs/
│   └── ...
├── pkgs/
│   └── ...
├── scripts/
│   └── ...
├── hosts/
│   ├── linux/
│   │   ├── edge/
│   │   │   └── ...
│   │   ├── server/
│   │   │   └── ...
│   │   └── workstation/
│   │       └── ...
│   └── darwin/
│       └── ...
├── modules/
│   ├── common/
│   │   └── ...
│   ├── profiles/
│   │   └── ...
│   ├── users/
│   │   └── ...
│   └── services/
│       └── ...
├── overlays/
│   └── ...
├── secrets/
│   ├── sops/
│   │   └── ...
│   └── ...
├── flake.nix
├── flake.lock
└── README.md
```

## Naming Convention

Each set of devices are named according to a different Pantheon.

1. **Linux Compute:** Greek mythology;
2. **Linux Edge:** Roman mythology; and
3. **Darwin/MacOS:** Norse mythology.
