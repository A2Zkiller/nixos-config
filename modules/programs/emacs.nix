{self, ...}: {
  flake.nixosModules.emacs = {
    pkgs,
    lib,
    config,
    ...
  }: let
    user = config.preferences.user.name;
  in {
    environment.systemPackages = [
      pkgs.emacs

      pkgs.git
    ];

    environment.variables = {
      EDITOR = "emacs";
    };

    # TODO: Setup Hjem emacs config from github
    hjem.users.${user} = {
      enable = true;

      # into ~/.config/emacs
      xdg.config.files.emacs = {
        source = pkgs.fetchFromGitHub {
          owner = "A2Zkiller";
          repo = "emacs-config";
          rev = "833a21f";
          hash = lib.fakeHash;
        };

        type = "directory";
        permissions = "644";
        clobber = false;
      };
    };

    imports = [
      self.nixosModules.hjem
    ];
  };
}
