{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.nh = {config, ...}: let
    user = config.preferences.user.name;
  in {
    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep 3";
      };

      flake = "/home/${user}/nixos-config";
    };
  };
}
