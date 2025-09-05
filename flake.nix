{
  description = "My config but built with Denix.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    denix = {
      url = "github:yunfachi/denix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    { denix, ... }@inputs:
    let
      mkConfigurations =
        moduleSystem:
        denix.lib.configurations {
          inherit moduleSystem;
          homeManagerUser = "a2z"; 

          paths = [
            ./hosts
            ./modules
            ./rices
          ];

          extensions = with denix.lib.extensions; [
            args
            (base.withConfig {
              args.enable = true;
            })
          ];

          specialArgs = {
            inherit inputs;
          };
        };
    in
    {
      nixosConfigurations = mkConfigurations "nixos";
      homeConfigurations = mkConfigurations "home";
    };
}
