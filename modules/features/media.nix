{...}: {
  flake.nixosModules.media = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.mpv
      pkgs.qimgv
    ];

    xdg.mime.defaultApplications = let
      images = "qimgv.desktop";
      videos = "mpv.desktop";
    in {
      "images/*" = images;
      "video/*" = videos;
      "audio/*" = videos;
    };
  };
}
