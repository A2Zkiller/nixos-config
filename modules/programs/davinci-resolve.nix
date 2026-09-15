{self, inputs, ...}: {
  flake.nixosModules.davinci-resolve = {pkgs, ...}: {
    imports = [
      self.nixosModules.ffmpeg
    ];

    environment.systemPackages = [
      # pkgs.davinci-resolve-studio
      (pkgs.callPackage ./_davinci-resolve-package.nix { studioVariant = true; })
    ];

    environment.variables = {
      RUSTICL_ENABLE = "radeonsi";
    };

    hardware.graphics = {
      enable = true;
      extraPackages = [
	pkgs.mesa.opencl
      ];
    };
  };
}
