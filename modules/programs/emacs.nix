{self, ...}: {
  flake.nixosModules.emacs = {pkgs, ...}: let
    selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system};
  in {
    environment.systemPackages = [
      pkgs.myEmacs

      selfpkgs.git
      selfpkgs.jujutsu

      pkgs.direnv
      pkgs.devenv

      pkgs.rassumfrassum
    ];

    environment.variables = {
      EDITOR = "emacsclient";
    };

    nixpkgs.config.packageOverrides = pkgs: rec {
      myEmacs = pkgs.emacs.pkgs.withPackages (epkgs:
        with epkgs; [
          vterm

          treesit-grammars.with-all-grammars
        ]);
    };

    fonts.packages = [
      pkgs.emacs-all-the-icons-fonts
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.noto-fonts
    ];
  };
}
