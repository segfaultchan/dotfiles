{ config, pkgs, ... }:

{
  imports = [
    ./desktop-environment.nix
  ];
  home.sessionPath = [ "$HOME/.nix-profile/bin" ];
  home.username = "kapyt";
  home.stateVersion = "25.05";
  home.homeDirectory = "/home/kapyt";

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "segfaultchan";
    userEmail = "segfaultchan@example.com";
  };

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "lsd";
      ip = "ip";
      rm = "rip";
      cp = "cp -r";
      rsync = "rsync -cr --progress";
      cat = "bat";
    };

    plugins = [
      {
        name = "zsh-nix-shell";
	file = "nix-shell.plugin.zsh";
	src = pkgs.fetchFromGitHub {
          owner = "chisui";
	  repo = "zsh-nix-shell";
	  rev = "v0.8.0";
	  sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
	};
      }
    ];
  };

  home.packages = with pkgs; [
    htop fastfetch lsd bat rm-improved rsync bat shadowsocks-rust
  ];
}
