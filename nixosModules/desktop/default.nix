{ ... }:
{
  imports = [
    ./locker
    ./loginManager
    ./windowManager
  ];

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}
