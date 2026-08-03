{self, ...}: {
  flake.nixosModules.emacs = {pkgs, ...}: let
    selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system};
  in {
    services.emacs = {
      enable = true;
      package = selfpkgs.myEmacs;
    };

    environment.systemPackages = [
      selfpkgs.myEmacs
      selfpkgs.git
      selfpkgs.jujutsu

      pkgs.direnv
      pkgs.devenv

      pkgs.rassumfrassum # multiple lsp servers with eglot
      pkgs.emacs-lsp-booster
    ];

    environment.variables = {
      EDITOR = "emacsclient";
    };

    fonts.packages = [
      pkgs.emacs-all-the-icons-fonts
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.noto-fonts
    ];
  };

  perSystem = {pkgs, ...}: {
    packages.myEmacs = pkgs.emacs.pkgs.withPackages (epkgs:
      with epkgs; [
        vterm
	auctex

        treesit-grammars.with-all-grammars
      ]);
  };
}
