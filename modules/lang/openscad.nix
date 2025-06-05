{ pkgs, ... }:
{
  plugins = {
    openscad = {
      enable = true;
    };
    lsp.servers.openscad_lsp = {
      enable = true;
      settings = {
        fmt_exe = "${pkgs.clang-tools}/bin/clang-format";
        fmt-style = "file";
      };
    };
  };
}
