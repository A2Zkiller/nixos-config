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
      clean.enable = true;

      flake = "/home/${user}/nixos-config";
    };
  };
}
