{
  inputs,
  pkgs,
  lib,
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

        package = pkgs.neovim-unwrapped;

        theme = {
          enable = true;
	  name = lib.mkDefault "catppuccin";
  	  style = "mocha";
        };

        lsp.enable = true;

	statusline.lualine.enable = true;
	telescope.enable = true;
	autocomplete.nvim-cmp.enable = true;

	languages = {
	  enableTreesitter = true;

	  nix.enable = true;
          rust.enable = true;
	};
        
        options.shiftwidth = 4;
        utility.sleuth.enable = true;
      };
    };
  };
}
