{
  self,
  inputs,
  ...
}: {
  systems = [
    "x86_64-linux"
    "x86_64-darwin"
    "aarch64-linux"
    "aarch64-darwin"
  ];

  perSystem = {system, ...}: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;

      config.permittedInsecurePackages = [
        "librewolf-151.0.1-2"
        "librewolf-bin-151.0.1-2"
        "librewolf-unwrapped-151.0.1-2"
        "librewolf-bin-unwrapped-151.0.1-2"
      ];

      config.allowUnfree = true;
    };
  };
}
