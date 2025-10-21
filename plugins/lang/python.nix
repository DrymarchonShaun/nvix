{
  plugins.lsp.servers = {
    ruff.enable = true;
    basedpyright = {
      enable = true;
      settings = {
        basedpyright.typeCheckingMode = "recommended";

      };
    };
  };
}
