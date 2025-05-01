{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = {
    home.packages = with pkgs; [
      lazygit
      neovim
      just

      clipboard-jh
      gcc
      gnumake
      ripgrep
      unzip
    ];

    programs.git = {
      enable = true;

      userName = "Mahyar Mirrashed";
      userEmail = "mah.mirr@gmail.com";

      aliases = {
        fuckit = "!${lib.getExe pkgs.git} reset --hard && ${lib.getExe pkgs.git} clean -fdx";
      };

      extraConfig = {
        core.editor = "nvim";
        core.eol = "lf";
        core.autocrlf = "input";
        color.ui = "auto";
        fetch.prune = true;
        init.defaultBranch = "main";
        push.default = "upstream";
        rebase.updateRefs = true;
      };

      ignores = [
        "*~"
        "*.swp"
        "*.bak"
        ".DS_Store" # MacOS Finder files
      ];

      ## Extraneous Git programs

      delta.enable = true;
    };

    programs.gh = {
      enable = true;

      settings = {
        editor = "nvim";
        git_protocol = "ssh";
      };
    };

    programs.tmux = {
      enable = true;

      baseIndex = 1;
      clock24 = true;
      keyMode = "vi";
      terminal = "screen-256color";

      plugins = with pkgs; [
        tmuxPlugins.battery
        tmuxPlugins.cpu
      ];
      extraConfig = ''
        set -g status-right 'CPU: #{cpu_percentage} | #{battery_graph} | %a, %h %d @ %H:%M '
      '';
    };
  };
}
