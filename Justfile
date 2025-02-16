# Validate configuration.
check:
  nix flake check --all-systems

# Format configuration.
fmt:
  nix fmt **.nix
