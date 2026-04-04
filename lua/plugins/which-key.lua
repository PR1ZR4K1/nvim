return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Show Buffer-Local Keymaps",
    },
  },
  opts = {
    preset = "helix",
    delay = function(ctx)
      return ctx.plugin and 0 or 200
    end,
    filter = function(mapping)
      return (mapping.desc and mapping.desc ~= "") or (mapping.group and mapping.group ~= "")
    end,
    show_help = true,
    show_keys = false,
    notify = true,
    expand = 1,
    sort = { "local", "order", "group", "alphanum", "mod" },
    win = {
      width = { min = 32, max = 48 },
      height = { min = 8, max = 0.8 },
      col = -1,
      row = -1,
      border = "rounded",
      title = true,
      title_pos = "left",
      padding = { 0, 1 },
      wo = {
        winblend = 0,
      },
    },
    layout = {
      width = { min = 32, max = 48 },
      spacing = 2,
    },
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    replace = {
      key = {
        function(key)
          return require("which-key.view").format(key)
        end,
        { "<Space>", "SPC" },
      },
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      ellipsis = "…",
      mappings = true,
      colors = true,
    },
    spec = {
      { "<leader>f", group = "Find", icon = { icon = "", color = "cyan" } },
      { "<leader>g", group = "Git", icon = { icon = "", color = "orange" } },
      { "<leader>w", group = "Session", icon = { icon = "󰆓", color = "blue" } },
      { "<leader>s", group = "Splits", icon = { icon = "", color = "yellow" } },
      { "<leader>x", group = "Diagnostics", icon = { icon = "", color = "orange" } },
      { "<leader>c", group = "Code", icon = { icon = "󰘦", color = "purple" }, mode = { "n", "v" } },
      { "<leader>?", desc = "Show Buffer-Local Keymaps" },
      { "<leader>+", desc = "Increment Number" },
      { "<leader>-", desc = "Decrement Number" },
      { "<leader>D", desc = "Show Buffer Diagnostics" },
      { "<leader>ca", desc = "Show Code Actions", mode = { "n", "v" } },
      { "<leader>cl", desc = "Toggle LSP Locations" },
      { "<leader>cs", desc = "Toggle Symbols Outline" },
      { "<leader>d", desc = "Show Line Diagnostics" },
      { "<leader>fg", desc = "Search Project Text" },
      { "<leader>fk", desc = "Search Keymaps" },
      { "<leader>gf", desc = "Format Current Buffer" },
      { "<leader>gg", desc = "Open Git Status" },
      { "<leader>nh", desc = "Clear Search Highlights" },
      { "<leader>o", desc = "Run Command" },
      { "<leader>r", desc = "Re-run Last Command" },
      { "<leader>rn", desc = "Rename Symbol" },
      { "<leader>rs", desc = "Restart LSP" },
      { "<leader>se", desc = "Equalize Split Sizes" },
      { "<leader>sh", desc = "Open Horizontal Split" },
      { "<leader>sv", desc = "Open Vertical Split" },
      { "<leader>sx", desc = "Close Current Split" },
      { "<leader>t", desc = "Toggle Runner Terminal" },
      { "<leader>tf", desc = "Open Current Buffer in New Tab" },
      { "<leader>tn", desc = "Go to Next Tab" },
      { "<leader>to", desc = "Open New Tab" },
      { "<leader>tp", desc = "Go to Previous Tab" },
      { "<leader>tx", desc = "Close Current Tab" },
      { "<leader>u", desc = "Toggle Undo History" },
      { "<leader>wa", desc = "Toggle Session Autosave" },
      { "<leader>wr", desc = "Search Saved Sessions" },
      { "<leader>ws", desc = "Save Current Session" },
      { "<leader>xL", desc = "Toggle Location List" },
      { "<leader>xQ", desc = "Toggle Quickfix List" },
      { "<leader>xx", desc = "Toggle Workspace Diagnostics" },
      { "<leader>xX", desc = "Toggle Buffer Diagnostics" },
      { "<leader>y", desc = "Yank to System Clipboard", mode = { "n", "v" } },
    },
  },
}
