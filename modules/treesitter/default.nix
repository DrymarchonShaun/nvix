{
  pkgs,
  inputs,
  lib,
  ...
}:
{

  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "buffer-manager";
      src = inputs.tssorter;
      dependencies = [ pkgs.vimPlugins.nvim-treesitter ];
    })
  ];

  extraConfigLua = ''
    local tssorter = require("tssorter")

    tssorter.setup({
      -- Define sorters per filetype
      sortables = {
        nix = {
          -- TODO: inherit(a) b c d;
          -- attr = { node = { "attr" } },
          attrset = { node = { "binding" } },
          formal = {
            node = { "formal" },
            order_by = function(node1, node2)
              local line1 = require("tssorter.tshelper").get_text(node1)
              local line2 = require("tssorter.tshelper").get_text(node2)
              local overrides = {}
              for index, value in ipairs({
                "self",
                "inputs",
                "inputs'",
                "outputs",
                "outputs'",
                "sources",
                "options",
                "config",
                "pkgs",
                "lib",
              }) do
                overrides[value] = index
              end

              local index1 = overrides[line1]
              local index2 = overrides[line2]
              if index1 and index2 then
                return index1 < index2
              elseif index1 then
                return true
              elseif index2 then
                return false
              else
                return line1 < line2
              end
            end,
          },
          list = { node = { "element" } },
        },
      },
    })
  '';

  plugins = {
    treesitter = {
      enable = true;
      settings = {
        highlight = {
          enable = true;
          disable = [
            "latex"
            "markdown"
          ];
        };
        auto_install = true;
        incremental_selection.enable = true;
      };
    };
  };
  imports =
    with builtins;
    with lib;
    map (fn: ./${fn}) (
      filter (fn: (fn != "default.nix" && !hasSuffix ".md" "${fn}")) (attrNames (readDir ./.))
    );
}
