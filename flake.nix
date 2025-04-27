{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
  };

  outputs = { ... }@inputs: 
  let
    myLib = import ./myLib/default.nix { inherit inputs; };
  in with myLib; {
    nixosConfigurations = {
      vmware = mkSystem ./hosts/vmware/configuration.nix;
    };

    homeConfigurations = {
      "a2z@vmware" = mkHome "x86_64-linux" ./hosts/vmware/home.nix;
    };

    homeManagerModules.default = ./homeManagerModules;
    nixosModules.default = ./nixosModules;
  };
}
