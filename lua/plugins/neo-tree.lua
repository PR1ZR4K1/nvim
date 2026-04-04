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
        filtered_items = {
          visible = true,        -- show hidden files (dimmed)
          hide_dotfiles = false, -- don't hide dotfiles
          hide_gitignored = false, -- optional: also show gitignored files
        },
      },
    })

    vim.keymap.set("n", "<C-n>", ':Neotree toggle right<CR>', { desc = "Toggle File Explorer" })
  end
}
