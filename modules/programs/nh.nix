{self, inputs, withSystem, ...}: {
  flake.nixosModules.nh = {pkgs, ...}: {
    programs.nh = {
      enable = true;
      clean.enable = true;

      package = withSystem pkgs.stdenv.hostPlatform.system ({config, ...}: config.packages.myNh);
    };
  };

  flake.wrappers.myNh = {pkgs, wlib, ...}: {
    imports = [ wlib.modules.default ];

    inherit pkgs;

    drv = pkgs.nh;
    env.NH_FLAKE = "/home/a2z/nixos-config";
  };
}
