{
  pkgs, 
  config,
  lib,
  inputs,
  ...
}: {
  myHomeManager = {
    zsh.enable = lib.mkDefault true;
    lf.enable = lib.mkDefault true;
    nix-extra.enable = lib.mkDefault true;
    btop.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
    stylix.enable = lib.mkDefault true;
    nvf.enable = lib.mkDefault true;
  };

  programs.home-manager.enable = true;

  programs.bat.enable = true;

  home.packages = with pkgs; [
    nil
    file
    git
    p7zip
    unzip
    zip
    stow
    killall
    imagemagick
    libqalculate
    stow

    fzf
    htop
    lf
    eza
    fd
    zoxide
    du-dust
    ripgrep
    neofetch

    ffmpeg
    wget

    yt-dlp

    nh
  ];

  home.sessionVariables = {
    FLAKE = ./../..;
    NIXOS_OZONE_WL = "1";    
  };
}
