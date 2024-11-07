{ name, ... }:
{
  networking.hostName = name;

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Amsterdam";
}
