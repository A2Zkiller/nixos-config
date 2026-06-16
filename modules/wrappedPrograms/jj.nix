{
  self,
  inputs,
  ...
}: {
  perSystem = {pkgs, ...}: {
    packages.jujutsu = inputs.wrappers.wrappers.jujutsu.wrap {
      inherit pkgs;

      settings = {
        user = {
          name = "A2Zkiller";
          email = "zureikatabdullah@gmail.com";
        };
      };
    };
  };
}
