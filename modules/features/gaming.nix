{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.gaming = {
    pkgs,
    lib,
    ...
  }: {
    hardware.graphics.enable = lib.mkDefault true;

    programs.steam = {
      enable = true;
      protontricks.enable = true;

      # Fix for steam pulse crash on startup
      package = pkgs.steam.override {
        extraEnv = {
          PULSE_RUNTIME_PATH = "/nonexistent";
        };
      };
    };

    programs.gamemode.enable = true;
    programs.gamescope.enable = true;

    environment.systemPackages = [
      pkgs.lutris
      pkgs.prismlauncher

      pkgs.mangohud
      pkgs.steamtinkerlaunch

      pkgs.steam-run
      pkgs.dxvk
    ];
  };
}
