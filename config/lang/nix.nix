{ inputs, lib, pkgs, ... }: {
  plugins = {
    nix.enable = true;
    nix-develop.enable = true;
    /* lsp.servers.nil-ls = {
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
    */
    lsp.servers.nixd.enable = true;
    none-ls = {
      sources = {
        formatting.nixfmt = {
          enable = true;
          package = pkgs.nixfmt-rfc-style;
        };
        code_actions = { statix.enable = true; };
        diagnostics = {
          statix.enable = true;
          deadnix.enable = true;
        };
      };
    };
  };
}
