{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.gdb = {
    pkgs,
    config,
    ...
  }: let
    user = config.preferences.user.name;
  in {
    hjem.users.${user}.files = {
      ".config/gdb/gdbinit".text = ''
        set startup-with-shell off
      '';
    };

    environment.systemPackages = [pkgs.gdb];
  };
}
