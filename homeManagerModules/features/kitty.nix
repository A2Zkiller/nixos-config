{
  pkgs,
  config,
  ...
}: {
  programs.kitty = {
    enable = true;

    shellIntegration.enableZshIntegration = true;
    settings = {
      enable_audio_bell = "no";

      # cursor = "#${base06}";
      cursor_text_color = "background";

      allow_remote_control = "yes";
      listen_on = "unix:/tmp/kitty";
      shell_integration = "enabled";
    };
  };
}
