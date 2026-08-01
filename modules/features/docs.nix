{
  flake.nixosModules.docs = {pkgs, ...}: {
    documentation = {
      # enable apropos
      man.cache.enable = true;

      dev.enable = true;
    };

    environment.systemPackages = [
      pkgs.man-pages
      pkgs.man-pages-posix
    ];
  };
}
