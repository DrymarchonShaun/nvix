{ pkgs, inputs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "none-ls";
      src = inputs.none-ls;
    })
  ];
  extraConfigLua = # lua
    ''
      require("null-ls").setup({
        sources = {
          require("null-ls").builtins.formatting.nix_flake_fmt,
          require("null-ls").builtins.diagnostics.deadnix.with({
            extra_args = {
              "-l"
            }
          })
          }
        })
    '';
}
