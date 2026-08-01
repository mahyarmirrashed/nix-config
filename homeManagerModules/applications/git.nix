{ lib, pkgs, ... }:
{
  programs.delta.enable = true;
  programs.delta.enableGitIntegration = true;
  programs.delta.enableJujutsuIntegration = true;

  programs.lazygit.enable = true;

  programs.jujutsu = {
    enable = true;

    settings = {
      user.name = "Mahyar Mirrashed";
      user.email = "mah.mirr@gmail.com";
    };
  };

  programs.git = {
    enable = true;

    settings = {
      user.name = "Mahyar Mirrashed";
      user.email = "mah.mirr@gmail.com";

      alias.fuckit = "!${lib.getExe pkgs.git} reset --hard && ${lib.getExe pkgs.git} clean -fdx";

      core.autocrlf = "input";
      core.editor = "zenvim";

      diff.algorithm = "histogram";

      fetch.prune = true;

      init.defaultBranch = "main";

      merge.conflictStyle = "zdiff3";

      pull.rebase = true;

      push.autoSetupRemote = true;
      push.default = "upstream";

      rebase.updateRefs = true;

      rerere.enabled = true;
    };

    ignores = [
      "*~"
      "*.swp"
      "*.bak"
      ".DS_Store"
    ];
  };

  programs.gh = {
    enable = true;

    settings = {
      editor = "zenvim";
      git_protocol = "ssh";
    };
  };

  home.packages = with pkgs; [
    lazyjj
  ];
}
