{delib, ...}:
delib.module {
  name = "home";

  home.always = {myconfig, ...}: let
    inherit (myconfig.constants) username;
  in {
    home = {
      inherit username;

      homeDirectory = "/home/${username}";
    };

    programs.home-manager.enable = true;
  };

  nixos.always.home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
