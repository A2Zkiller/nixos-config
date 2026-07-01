{inputs, ...}: {
  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.myEmacs = inputs.wrappers.wrappers.emacs.wrap {
      inherit pkgs;

      package = pkgs.emacs;

      configFile = builtins.readFile ./config/init.el;

      emacsPackages = epkgs:
        with epkgs.melpaPackages; [
          catppuccin-theme
        ];
    };
  };
}
