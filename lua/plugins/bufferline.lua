return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "catppuccin/nvim",
  },
  config = function()
    local highlights = nil
    local has_catppuccin, catppuccin_bufferline = pcall(require, "catppuccin.special.bufferline")

    if has_catppuccin then
      highlights = catppuccin_bufferline.get_theme()
    end

    require("bufferline").setup({
      highlights = highlights,
      options = {
        mode = "tabs",
        always_show_bufferline = false,
        auto_toggle_bufferline = true,
        show_close_icon = false,
        show_buffer_close_icons = false,
        show_tab_indicators = false,
        separator_style = "slant",
        indicator = {
          style = "underline",
        },
        name_formatter = function(tab)
          return string.format("Window %d", vim.api.nvim_tabpage_get_number(tab.tabnr))
        end,
      },
    })
  end,
}
