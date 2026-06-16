{self, inputs, ...}: {
  perSystem = {pkgs, lib, ...}: {
    packages.myLibrewolf = pkgs.wrapFirefox pkgs.librewolf-unwrapped {
      extraPolicies = {
        ExtensionSettings = {
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };

          "jid1-MnnxcxisBPnSXQ@jetpack" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
            installation_mode = "force_installed";
          };

          "{76aabc99-c1a8-4c1e-832b-d4f2941d5a7a}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/"
              + "catppuccin-mocha-mauve-git/latest.xpi";
            installation_mode = "normal_installed";
          };
        };
      };

      extraPrefs = ''
          defaultPref("sidebar.verticalTabs", true);
          defaultPref("sidebar.expandOnHover", true);
        '';
    };
  };
}
