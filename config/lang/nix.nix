{ inputs, lib, pkgs, ... }: {
  plugins = {
    nix.enable = true;
    nix-develop.enable = true;
    lsp.servers.nil-ls = {
      enable = true;
      package = inputs.nil.packages.${pkgs.system}.default;
      extraOptions = {
        nix = {
          maxMemoryMB = 0;
          flake = {
            autoArchive = lib.mkDefault true;
            autoEvalInputs = lib.mkDefault true;
            nixpkgsInputName = "nixpkgs";
          };
        };
      };
    };
    none-ls = {
      sources = {
        formatting.nixfmt.enable = true;
        code_actions = { statix.enable = true; };
        diagnostics = {
          statix.enable = true;
          deadnix.enable = true;
        };
      };
    };
  };
}
