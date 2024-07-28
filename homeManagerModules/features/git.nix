{inputs, ...}: {
  programs.git = {
    enable = true;
    userEmail = "zureikatabdullah@gmail.com";
    userName = "A2Zkiller";
    extraConfig = {
      core.editor = "nvim";
    };
  };
}
