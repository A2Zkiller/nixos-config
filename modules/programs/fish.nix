{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "programs.fish";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs = {
    fish = {
      enable = true;
      shellAliases = {
        cat = "${pkgs.bat}/bin/bat";
        ls = "${pkgs.eza}/bin/eza --icons -a --group-directories-first";
        tree = "${pkgs.eza}/bin/eza --color=auto --tree";
        grep = "grep --color=auto";
        cd = "z";
      };
      package = pkgs.fish;
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  nixos.ifEnabled = {myconfig, ...}: let
    inherit (myconfig.constants) username;
  in {
    users.users.${username} = {
      shell = pkgs.fish;
      ignoreShellProgramCheck = true;
    };
  };
}
