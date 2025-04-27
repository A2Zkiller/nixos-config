{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        vimAlias = true;

        theme = {
          enable = true;
	  name = "catppuccin";
  	  style = "mocha";
        };

        lsp.enable = true;

	statusline.lualine.enable = true;
	telescope.enable = true;
	autocomplete.nvim-cmp.enable = true;

	languages = {
          enableLSP = true;
	  enableTreesitter = true;

	  nix.enable = true;
          rust.enable = true;
	};

      };
    };
  };
}
