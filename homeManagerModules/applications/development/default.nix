{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = {
    home.packages = with pkgs; [
      jujutsu
      lazygit
      neovim
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
  };
}
