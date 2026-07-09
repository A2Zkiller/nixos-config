{self, ...}: {
  flake.nixosModules.emacs = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.emacs

      pkgs.git
    ];

    environment.variables = {
      EDITOR = "emacs";
    };

    # TODO: Setup Hjem emacs config from github
  };
}
