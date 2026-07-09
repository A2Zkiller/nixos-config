{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktop = {pkgs, ...}: let
    selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system};
  in {
    imports = [
      self.nixosModules.general
      self.nixosModules.audio
      self.nixosModules.printing

      self.nixosModules.niri

      self.nixosModules.librewolf
      self.nixosModules.uget

      self.nixosModules.gtk
    ];

    services.displayManager.ly.enable = true;

    fonts.packages = [
      pkgs.nerd-fonts.jetbrains-mono

      pkgs.noto-fonts
    ];
  };
}
