{ delib, ... }:
delib.module {
  name = "constants";

  options.constants = with delib; {
    username = readOnly (strOption "a2z");
    userfullname = readOnly (strOption "Abdullah Zureikat");
    useremail = readOnly (strOption "zureikatabdullah@gmail.com");
  };
}
