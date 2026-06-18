{...}: {
  flake.nixosModules.media = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.mpv
      pkgs.feh
    ];
  };
}
