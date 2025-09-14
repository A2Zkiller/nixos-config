{
  delib,
  host,
  ...
}:
delib.module {
  name = "services.networking";

  options = delib.singleEnableOption true;

  nixos.ifEnabled = {myconfig, ...}: {
    networking = {
      # hostName = myconfig.constants.username;
      hostName = host.name;
      networkmanager.enable = true;
      firewall.enable = true;
    };
  };
}
