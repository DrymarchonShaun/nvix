{ lib, pkgs, ... }:
{
    # none-ls = {
    #   enable = mkDefault true;
    #   sources = {
    #     formatting.nix_flake_fmt = true;
    #   };
    # };
    lsp = {
      servers.nixd = {
        enable = true;
        extraOptions = {
          offset_encoding = "utf-8";
        };
      };
    };
  };
}
