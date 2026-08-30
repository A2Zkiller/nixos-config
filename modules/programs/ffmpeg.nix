{
  flake.nixosModules.ffmpeg = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.ffmpeg
    ];
  };
}
