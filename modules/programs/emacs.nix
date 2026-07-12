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
      pkgs.myEmacs

      pkgs.git

      pkgs.direnv
      pkgs.devenv
    ];

    environment.variables = {
      EDITOR = "emacsclient";
    };

    nixpkgs.config.packageOverrides = pkgs: rec {
      myEmacs = pkgs.emacs.pkgs.withPackages (epkgs:
        with epkgs; [
          vterm
        ]);
    };

    fonts.packages = [
      pkgs.emacs-all-the-icons-fonts
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.noto-fonts
    ];

    # TODO: Setup Hjem emacs config from github
    # hjem.users.${user} = {
    #   enable = true;

    #   # into ~/.config/emacs
    #   xdg.config.files.emacs = {
    #     source = pkgs.fetchFromGitHub {
    #       owner = "A2Zkiller";
    #       repo = "emacs-config";
    #       rev = "833a21f";
    #       hash = lib.fakeHash;
    #     };

    #     type = "directory";
    #     permissions = "644";
    #     clobber = false;
    #   };
    # };

    # imports = [
    #   self.nixosModules.hjem
    # ];
  };
}
