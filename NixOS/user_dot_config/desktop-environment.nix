{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  # wayland
    niri waybar fuzzel kitty firefox pavucontrol brightnessctl wl-clipboard mako
    vulkan-tools xwayland-satellite
  # fonts
    noto-fonts
    noto-fonts-cjk-sans
    nerd-fonts.hack
  ];
  fonts.fontconfig.enable = true;
}
