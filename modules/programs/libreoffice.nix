{
  flake.nixosModules.libreoffice = {pkgs, ...}: {
    # From: https://wiki.nixos.org/wiki/LibreOffice
    environment.systemPackages = with pkgs; [
      # Libreoffice
      libreoffice-qt

      # Spellcheck
      hunspell
      hunspellDicts.uk_UA
      hunspellDicts.th_TH

      # Hyphenation dictionaries
      hyphenDicts.en_GB # British English
      hyphenDicts.de_DE # German, etc.
    ];
  };
}
