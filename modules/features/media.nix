{...}: {
  flake.nixosModules.media = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.mpv
      pkgs.feh
    ];

    xdg.mime.defaultApplications = let
      images = "feh.desktop";
      videos = "mpv.desktop";
    in {
      "images/*" = images;
      "video/*" = videos;
      "audio/*" = videos;
    };
  };
}
