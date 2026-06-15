{inputs, ...}: {
  perSystem = {pkgs, ...}:
    let
      username = "A2Zkiller";
      email = "zureikatabdullah@gmail.com";
    in {

    packages.git = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;

      package = pkgs.git;

      env = {
        GIT_AUTHOR_NAME = username;
        GIT_AUTHOR_EMAIL = email;
        GIT_COMMITTER_NAME = username;
        GIT_COMMITTER_EMAIL = email;
      };
    };
  };
}
