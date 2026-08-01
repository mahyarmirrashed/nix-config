{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    clock24 = true;
    focusEvents = true;
    keyMode = "vi";
    mouse = true;
    terminal = "tmux-256color";

    plugins = with pkgs; [
      tmuxPlugins.battery
      tmuxPlugins.continuum
      tmuxPlugins.cpu
      tmuxPlugins.pain-control
      tmuxPlugins.resurrect
      tmuxPlugins.yank
    ];

    extraConfig = ''
      set -g @continuum-restore 'on'
      set -g renumber-windows on
      set -g status-right 'CPU: #{cpu_percentage} | #{battery_graph} | %a, %h %d @ %H:%M '

      bind-key -T copy-mode-vi v send -X begin-selection
    '';
  };
}
