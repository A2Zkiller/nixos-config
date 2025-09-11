{ delib, ... }:
delib.module {
  name = "programs.git";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.git =
    { myconfig, ... }:
    {
      enable = true;

      userName = "A2Zkiller";
      userEmail = myconfig.constants.useremail;

      extraConfig = {
        core.editor = "nvim";
      };
    };
}
