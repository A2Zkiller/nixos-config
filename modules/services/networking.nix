{
  delib,
  host,
  ...
}:
delib.module {
  name = "services.networking";

  options = delib.singleEnableOption true;

  nixos.ifEnabled.networking = {
    hostName = host.name;
    networkmanager.enable = true;
    firewall.enable = true;
  };
}
