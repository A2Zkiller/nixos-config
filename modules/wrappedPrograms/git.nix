{inputs, ...}: {
  perSystem = {pkgs, ...}: let
    username = "A2Zkiller";
    email = "zureikatabdullah@gmail.com";
  in {
    packages.git = inputs.wrappers.wrappers.git.wrap {
      inherit pkgs;

      package = pkgs.git;

      settings = {
        user = {
          name = username;
          email = email;
        };

        init.defaultBranch = "main";
      };
    };
  };
}
