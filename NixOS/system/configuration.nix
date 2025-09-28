{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./home-manager.nix
      ./graphics-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking = {
      nameservers = [ "1.1.1.1" ];
      wireless.iwd.enable = true;
      wireless.iwd.settings = {
        Network.EnableIPv6 = true;
        Settings = {
          AutoConnect = true;
      };
    };
  };

  time.timeZone = "Europe/Moscow";
  
  fonts.fontDir.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    earlySetup = true;
    font = "ter-d28b";
    keyMap = lib.mkForce "us";
    useXkbConfig = true;
    packages = with pkgs; [ terminus_font ];
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  users.users.kapyt = {
    isNormalUser = true;
    home = "/home/kapyt";
    extraGroups = [ "wheel" ]; 
    shell = pkgs.zsh;
    packages = with pkgs; [
      home-manager
    ];
  };

  environment.systemPackages = with pkgs; [
    neovim 
    wget
  ];

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.zsh.enable = true;

  services.openssh.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 80 443 ];
    allowedUDPPorts = [ 25565 ];
    allowedUDPPortRanges = [
      { from = 50000; to = 50099; }
    ];
  };
  system.copySystemConfiguration = true;

  system.stateVersion = "25.05";

}

