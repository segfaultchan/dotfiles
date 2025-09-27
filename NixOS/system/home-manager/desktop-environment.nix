{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  # wayland
    niri fuzzel kitty firefox
  # fonts
    noto-fonts
    noto-fonts-cjk-sans
    nerd-fonts.hack
  ];
  fonts.fontconfig.enable = true;
}
