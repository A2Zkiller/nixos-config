{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wrappers = {
      url = "github:BirdeeHub/nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    # TEMP: pinned nixpkgs for flatpack glycin issue
    nixpkgs-flatpak.url = "github:NixOS/nixpkgs/51effaf9783e0226281ad10e95a4af6c8a145316";

    # TEMP: pinned nixpkgs for xwayland-satellite
    nixpkgs-xwayland-satellite.url = "github:NixOS/nixpkgs/c4e0120b295daaac44f245f1c50ec06e844fe53b";

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./modules);
}
