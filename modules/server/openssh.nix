{delib, ...}:
delib.module {
  name = "server.openssh";

  options = delib.singleEnableOption true;

  nixos.ifEnabled = {myconfig, ...}: let
    keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP1gE5OV3FOZ5KGCEr/9kVo44vgw81DF7TGGskM6srMy zureikatabdullah@gmail.com"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEb1z7g0oTbmhxMkzxO5ZeADY62ALEjF8HSRSgTu7IHA a2z@vmware"
    ];
  in {
    services.openssh.enable = true;

    users.users.root.openssh.authorizedKeys.keys = keys;
    users.users.${myconfig.constants.username}.openssh.authorizedKeys.keys = keys;
  };
}
