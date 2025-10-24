{ config, lib, ... }:
let
  inherit (lib.nixvim) mkRaw;
  inherit (config.nvix.mkKey) mkKeymap wKeyObj;
in
{
  wKeyList = [
    (wKeyObj [
      "<leader>e"
      "󰙅"
      "Explorer"
    ])
  ];

  keymaps = [
    (mkKeymap "n" "<leader>e" "<cmd>:Yazi<cr>" "Explorer")
  ];
}
