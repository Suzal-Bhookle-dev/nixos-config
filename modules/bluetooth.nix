{ config, pkgs, ... }:

{
  hardware.enableAllFirmware = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  hardware.firmware = [ pkgs.firmwareLinuxNonfree ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;
}
