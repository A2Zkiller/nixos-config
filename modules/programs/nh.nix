{self, inputs, getSystem, ...}: {
  flake.nixosModules.nh = {pkgs, ...}: {
    programs.nh = {
      enable = true;
      clean.enable = true;

      package = (getSystem pkgs.stdenv.hostPlatform.system).packages.myNh;
    };
  };

  flake.wrappers.myNh = {pkgs, wlib, ...}: {
    imports = [ wlib.modules.default ];

    inherit pkgs;

    drv = pkgs.nh;
    env.NH_FLAKE = "/home/a2z/nixos-config";
  };
}
