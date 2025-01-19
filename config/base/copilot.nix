{ mkKey, helpers, specObj, ... }:
let inherit (mkKey) mkKeymap;
in {
  plugins.copilot-lua = {
    enable = true;
    settings = {
      filetypes.markdown = true;
      suggestion = {
        enabled = true;
        autoTrigger = true;
      };
    };
  };
  wKeyList = [ (specObj [ "<leader>a" "󰚩" "ai" ]) ];
  keymaps = [
    (mkKeymap "n" "<leader>ac"
      (helpers.mkRaw # lua
        ''
          function()
            if vim.g.copilot_status == nil then
              vim.g.copilot_status = "running"
            end
            if vim.g.copilot_status == "running" then
              vim.g.copilot_status = "stopped"
              vim.cmd("Copilot disable")
            else
              vim.g.copilot_status = "running"
              vim.cmd("Copilot enable")
            end
          end
        '')
      "Toggle Copilot")
  ];
}
