{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "features.essentials";

  options = delib.singleEnableOption true;

  nixos.ifEnabled = {
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.config.allowUnfree = true;
  };

  home.ifEnabled = {
    home.packages = with pkgs; [
      ripgrep
      neofetch
      ffmpeg
    ];
  };
}
