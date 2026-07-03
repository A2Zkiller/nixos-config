{inputs, ...}: {
  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: let
    configDir = ./config;
  in {
    packages.myEmacs = inputs.wrappers.wrappers.emacs.wrap {
      inherit pkgs;

      package = pkgs.emacs;

      wrapperImplementation = lib.mkForce "nix";

      runShell = [
        ''
          mkdir -p ~/.emacs.d/
          ${lib.getExe pkgs.rsync} -a --no-t --checksum "${configDir}/" ~/.emacs.d/
          chmod -R u+w ~/.emacs.d/
        ''
      ];

      emacsPackages = epkgs:
        with epkgs.melpaPackages; [
          catppuccin-theme

          no-littering

          toc-org
          org-bullets
        ];
    };
  };
}
