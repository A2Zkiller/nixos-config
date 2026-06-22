{
  flake.nixosModules.printing = {...}: {
    services.printing.enable = true;

    # Network Autodiscovery
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
