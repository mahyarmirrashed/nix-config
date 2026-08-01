{ pkgs, ... }:
{
  programs.opencode = {
    enable = true;

    settings = {
      plugins = [
        "opencode-claude-auth@latest"
        "opencode-gemini-auth@latest"
      ];
    };
  };

  home.packages = [ pkgs.claude-code ];
}
