{self, ...}: {
  flake.nixosModules.obs-studio = {
    programs.obs-studio = {
      enable = true;
    };

    imports = [
      self.nixosModules.ffmpeg
    ];
  };
}
