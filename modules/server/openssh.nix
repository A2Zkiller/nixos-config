{delib, ...}:
delib.module {
  name = "server.openssh";

  options = delib.singleEnableOption true;

  nixos.ifEnabled = {myconfig, ...}: {
    services.openssh.enable = true;

    users.users.${myconfig.constants.username}.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP1gE5OV3FOZ5KGCEr/9kVo44vgw81DF7TGGskM6srMy zureikatabdullah@gmail.com"
    ];
  };
}
