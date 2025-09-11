{ delib, ... }:
delib.module {
  name = "services.networking";

  options = delib.singleEnableOption true;

  nixos.ifEnabled =
    { myconfig, ... }:
    {
      networking = {
        hostName = myconfig.constants.username;
        networkmanager.enable = true;
        firewall.enable = true;
      };
    };
}
