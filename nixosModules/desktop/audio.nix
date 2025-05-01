{ ... }:
{
  services.blueman.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.upower.enable = true;
}
