{ lib, pkgs, ... }:
let
formatter = [ "clang-format" ];
in {
    plugins = {
    lsp.servers.clangd = {
      enable = true;
    };
    conform-nvim.settings = {
      formatters_by_ft = {
        c = formatter;
        cpp = formatter;
      };
      formatters.clang_format.command = lib.getExe' pkgs.clang-tools "clang-format";
    };
  };
}
