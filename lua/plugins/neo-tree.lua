return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        hijack_netrw_behavior = "disabled",
      }
    })

    vim.keymap.set("n", "<C-n>", ':Neotree toggle right<CR>', {desc = 'Vscode???'})
  end
}
