{
  flake.nixosModules.obs-studio = {pkgs, ...}: {
    programs.obs-studio = {
      enable = true;
    };

    environment.systemPackages = [
      pkgs.ffmpeg
    ];
  };
}
