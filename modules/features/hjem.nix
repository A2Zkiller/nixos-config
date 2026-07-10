{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.hjem = {config, ...}: let
    user = config.preferences.user.name;
  in {
    imports = [
      inputs.hjem.nixosModules.default
    ];

    hjem.users.${user}.enable = true;
  };
}
