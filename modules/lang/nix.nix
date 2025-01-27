{
  plugins = {
    lsp.servers.nixd.enable = true;
    none-ls = {
      enable = true;
      sources.formatting.nix_flake_fmt = {
        enable = true;
        settings = {
          filetypes = [ "nix" ];
        };
      };
    };
  };
}
