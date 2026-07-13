{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.librewolf = {pkgs, ...}: {
    programs.firefox = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myLibrewolf;
    };

    xdg.mime.defaultApplications = let
      browsers = "librewolf.desktop;firefox.desktop";
    in {
      "text/html" = browsers;
      "text/xml" = browsers;
      "application/vnd.mozilla.xul+xml" = browsers;
      "application/xhtml+xml" = browsers;
      "x-scheme-handler/https" = browsers;
      "x-scheme-handler/http" = browsers;
    };
  };
}
