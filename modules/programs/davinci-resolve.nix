{self, inputs, ...}: {
  flake.nixosModules.davinci-resolve = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.davinci-resolve-studio
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
