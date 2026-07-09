{self, ...}: {
  flake.nixosModules.emacs = {
    pkgs,
    lib,
    ...
  }: {
    environment.systemPackages = [
      pkgs.emacs

      pkgs.git
    ];

    environment.variables = {
      EDITOR = "${lib.getExe pkgs.emacs}";
    };

    # TODO: Setup Hjem emacs config from github
  };
}
