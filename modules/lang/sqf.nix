{ pkgs, inputs, ... }:
{
  extraFiles = {
    "syntax/sqf.vim" = {
      enable = true;
      source = inputs.sqf-vim + "/syntax/sqf.vim";
    };

    "ftdetect/sqf.vim" = {
      enable = true;
      source = inputs.sqf-vim + "/ftdetect/sqf.vim";
    };
  };
}
