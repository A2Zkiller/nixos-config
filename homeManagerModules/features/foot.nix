{
  pkgs,
  config,
  ...
}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font="JetBrainsMonoNerdFont:size=12";
      };
    };
  };
}
