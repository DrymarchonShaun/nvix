{ lib, mkKey, specObj, pkgs, ... }:
let
  inherit (mkKey) mkKeymap;
in
with lib;
{
  plugins = {
    conform-nvim.enable = mkDefault true;
    # none-ls = {
    #   enable = mkDefault true;
    #   sources = {
    #     formatting.nix_flake_fmt = true;
    #   };
    # };
    lsp = {
      enable = mkDefault true;
      inlayHints = mkDefault true;
      servers.nixd.enable = true;
      #servers.nil-ls = {
      #  enable = true;
      #  settings.formatting.command = [ "${lib.getExe pkgs.nixpkgs-fmt}" ];
      #};
    };
  };

  extraConfigLua = # lua
    ''
      vim.keymap.set("n", "<leader>lf", function() require("conform").format() end, { noremap = true, silent = true, desc = "Format Buffer" })
      vim.keymap.set("v", "<leader>lf", function() require("conform").format() { async = true } end, { noremap = true, silent = true, desc = "Format Buffer" })
      vim.keymap.set("x", "<leader>lf", function() require("conform").format() { async = true } end, { noremap = true, silent = true, desc = "Format Buffer" })

    '';

  wKeyList = [
    (specObj [ "<leader>l" "󰿘" "lsp" ])
  ];
}
