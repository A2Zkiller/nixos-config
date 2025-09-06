{
  inputs,
  pkgs,
  lib,
  ...
}:
{
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
          name = lib.mkForce "catppuccin";
          style = "mocha";
        };

        languages = {
          enableTreesitter = true;

          markdown.enable = true;
          nix.enable = true;

          rust = {
            enable = true;
            # crates.enable = true;
          };
        };

        lsp = {
          enable = true;

          formatOnSave = true;
          trouble.enable = true;
          otter-nvim.enable = true;
        };

        git = {
          enable = true;
          gitsigns.enable = true;
          gitsigns.codeActions.enable = false;
        };

        notes = {
          todo-comments.enable = true;
        };

        ui = {
          borders.enable = true;
          colorizer.enable = true;
          illuminate.enable = true;
        };

        utility = {
          diffview-nvim.enable = true;

          motion = {
            hop.enable = true;
          };
        };

        filetree.neo-tree.enable = true;

        tabline.nvimBufferline.enable = true;

        binds.cheatsheet.enable = true;

        comments.comment-nvim.enable = true;

        statusline.lualine = {
          enable = true;
          theme = lib.mkForce "catppuccin";
        };

        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        snippets.luasnip.enable = true;

        visuals = {
          cinnamon-nvim.enable = true;
          nvim-cursorline.enable = true;
          fidget-nvim.enable = true;

          highlight-undo.enable = true;
        };

        autopairs.nvim-autopairs.enable = true;
        treesitter.context.enable = true;

        options.shiftwidth = 4;
        utility.sleuth.enable = true;
      };
    };
  };
}
