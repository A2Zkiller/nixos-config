{delib, ...}:
delib.module {
  name = "programs.git";

  options = delib.singleEnableOption true;

  home.ifEnabled = {myconfig, ...}: {
    programs.git = {
      enable = true;

      userName = "A2Zkiller";
      userEmail = myconfig.constants.useremail;

      extraConfig = {
        core.editor = "hx";
      };
    };

    programs.lazygit.enable = true;
  };
}
