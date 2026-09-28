{
  flake.nixosModules.gpg = {pkgs, ...}: {
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;

      pinentryPackage = pkgs.pinentry-curses;
    };

    environment.systemPackages = [
      pkgs.pinentry-curses
    ];
  };
}
