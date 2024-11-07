{
  description = "Mahyar's Nix configurations.";

  inputs.nixpkgs.url = "nixpkgs/nixos-24.05";

  outputs =
    { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;

      filterForDirectories =
        dirContents: builtins.attrNames (lib.filterAttrs (_n: v: v == "directory") dirContents);

      # Define the top-level hosts folder path (where all host configurations live)
      hostsRootDir = "${self}/hosts";

      # Retrieve the role directories (e.g., "./hosts/workstations", "./hosts/servers")
      getRolesInHostDir =
        hostsRootDir:
        map (role: "${hostsRootDir}/${role}") (filterForDirectories (builtins.readDir hostsRootDir));

      # Retrieve the host directories (e.g. "./hosts/workstations/cronos", "./hosts/servers/alpha")
      getHostsInRoleDir =
        roleDir: map (host: "${roleDir}/${host}") (filterForDirectories (builtins.readDir roleDir));

      # Retrieve the system architecture from the host configuration.nix
      getSystemType =
        host:
        if builtins.pathExists "${host}/configuration.nix" then
          (import "${host}/configuration.nix").system
        else
          lib.asserts.fail "Error: ${host} is missing the configuration.nix file.";

      # Compute all hosts
      hosts = builtins.concatMap getHostsInRoleDir (getRolesInHostDir hostsRootDir);

      nixosHosts = builtins.filter (host: builtins.pathExists "${host}/system.nix") hosts;
    in
    {
      nixosConfigurations = builtins.listToAttrs (
        map (
          host:
          let
            systemType = getSystemType host;
          in
          {
            name = builtins.baseNameOf host;
            value = nixpkgs.lib.nixosSystem {
              system = systemType;
              modules = [
                (import "${host}/system.nix")
              ];
            };
          }
        ) nixosHosts
      );
    };
}
