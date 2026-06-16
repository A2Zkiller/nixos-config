{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.nix = {pkgs, ...}: {
    imports = [
      self.nixosModules.lix
      self.nixosModules.nh
    ];

    environment.systemPackages = [
      pkgs.alejandra
      pkgs.nil
      pkgs.nixd
    ];

    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.config.allowUnfree = true;
  };

  imports = [
    inputs.wrappers.flakeModules.wrappers # Adds support for flake-parts wrapppers
  ];
}
