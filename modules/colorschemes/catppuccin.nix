{ lib, ... }:
{

  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "macchiato";
      transparent_background = true;
      integrations = {
        noice = true;
        notify = true;
        which_key = true;
        bufferline = true;
        ufo = true;
        cmp = true;
        fidget = true;
        lsp_trouble = true;
        lsp_saga = true;
        nvimtree = true;
        snacks = true;
        gitsigns = true;
        telescope = {
          enabled = true;
          style = "nvchad";
        };
        neotree = true;
        neogit = true;
        treesitter = true;
        mini.enabled = true;
        window_picker = true;

        treesitter_context = true;
      };
    };
  };
  plugins.lualine.settings.options.theme = lib.mkForce "catppuccin";
}
