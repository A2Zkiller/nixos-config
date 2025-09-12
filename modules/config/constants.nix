{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "constants";

  options.constants = with delib; {
    username = readOnly (strOption "a2z");
    userfullname = readOnly (strOption "Abdullah Zureikat");
    useremail = readOnly (strOption "zureikatabdullah@gmail.com");

    wallpaper = pathOption ./.;
    polarity = strOption "dark";
    base16Scheme = strOption "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  };
}
