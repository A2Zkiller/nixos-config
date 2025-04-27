{ 
  pkgs,
  inputs,
  outputs,
  lib,
  ... 
}: {
  imports = [
    outputs.homeManagerModules.default
  ];

  myHomeManager = {
    bundles.general.enable = true;
    bundles.desktop-full.enable = true;

    pipewire.enable = true;
  };

  home.username = "a2z";
  home.homeDirectory = "/home/a2z";

  home.packages = with pkgs; [
    # firefox
    floorp

    foot
  ];

  home.stateVersion = "23.11"; 
}
