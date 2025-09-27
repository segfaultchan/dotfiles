{ config, pkgs, lib, ... }:

{
  services.xserver.videoDrivers = [ "modesetting" ];
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver vpl-gpu-rt
    ];
  };
  environment.systemPackages = with pkgs; [
    intel-gpu-tools
  ];
}
