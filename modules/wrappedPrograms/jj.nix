{self, inputs, ...}: {
  perSystem = {pkgs, ...}: {
    packages.jujutsu = inputs.wrappers.wrapperModules.jujutsu.apply {
      inherit pkgs;

      settings = {
        user = {
          name = "A2Zkiller";
          email = "zureikatabdullah@gmail.com";
        };
      };
    }.wrapper;
  };
}
