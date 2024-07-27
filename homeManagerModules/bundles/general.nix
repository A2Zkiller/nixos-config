{
  pkgs, 
  config,
  lib,
  inputs,
  ...
}: {
  nixpkgs.config.experimental-features = "nix-command flakes";

  myHomeManager.zsh.enable = lib.mkDefault true;
  myHomeManager.lf.enable = lib.mkDefault true;
  myHomeManager.nix-extra.enable = lib.mkDefault true;
  myHomeManager.btop.enable = lib.mkDefault true;
  myHomeManager.git.enable = lib.mkDefault true;

  myHomeManager.stylix.enable = lib.mkDefault true;

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
    neovim
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
    tree-sitter

    nh
  ];

  home.sessionVariables = {
    FLAKE = "${config.home.homeDirectory}";
  };
}
