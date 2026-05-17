{ config, pkgs, ... }: {
  home.username = "<USERNAME>";
  home.homeDirectory = "/home/<USERNAME>";
  home.stateVersion = "25.11";
  home.file = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./modules/git.nix
    ./modules/bash.nix
    ./modules/tools.nix
    ./modules/misc.nix
  ];

}
