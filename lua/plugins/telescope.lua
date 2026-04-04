return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      local themes = require("telescope.themes")
      local make_entry = require("telescope.make_entry")
      local entry_display = require("telescope.pickers.entry_display")
      local telescope_utils = require("telescope.utils")
      local action_utils = require("telescope.actions.utils")

      vim.api.nvim_set_hl(0, "TelescopeKeymapLhs", { link = "Identifier" })
      vim.api.nvim_set_hl(0, "TelescopeKeymapDesc", { link = "String" })
      vim.api.nvim_set_hl(0, "TelescopeKeymapMeta", { link = "Comment" })
      vim.api.nvim_set_hl(0, "TelescopeKeymapModeTag", { link = "Comment" })
      vim.api.nvim_set_hl(0, "TelescopeKeymapModeNormal", { link = "Function" })
      vim.api.nvim_set_hl(0, "TelescopeKeymapModeInsert", { link = "String" })
      vim.api.nvim_set_hl(0, "TelescopeKeymapModeVisual", { link = "Special" })
      vim.api.nvim_set_hl(0, "TelescopeKeymapModeSelect", { link = "Constant" })
      vim.api.nvim_set_hl(0, "TelescopeKeymapModeOperator", { link = "Operator" })
      vim.api.nvim_set_hl(0, "TelescopeKeymapModeCommand", { link = "Keyword" })
      vim.api.nvim_set_hl(0, "TelescopeKeymapModeTerminal", { link = "Number" })
      vim.api.nvim_set_hl(0, "TelescopeKeymapModeOther", { link = "Type" })

      local mode_icons = {
        n = { "󰋜", "TelescopeKeymapModeNormal" },
        i = { "󰏫", "TelescopeKeymapModeInsert" },
        v = { "󰈈", "TelescopeKeymapModeVisual" },
        x = { "󰈈", "TelescopeKeymapModeVisual" },
        s = { "󰒅", "TelescopeKeymapModeSelect" },
        o = { "󰆏", "TelescopeKeymapModeOperator" },
        c = { "󰘳", "TelescopeKeymapModeCommand" },
        t = { "", "TelescopeKeymapModeTerminal" },
      }

      local function keymap_entry_maker(opts)
        local displayer = entry_display.create({
          separator = " ",
          items = {
            { width = 2 },
            { width = 3 },
            { width = opts.width_lhs },
            { width = 2 },
            { remaining = true },
          },
        })

        local function get_desc(entry)
          if entry.callback and not entry.desc then
            return action_utils._get_anon_function_name(debug.getinfo(entry.callback))
          end

          return vim.F.if_nil(entry.desc, entry.rhs):gsub("\n", "\\n")
        end

        local function get_lhs(entry)
          return telescope_utils.display_termcodes(entry.lhs)
        end

        local function get_attr(entry)
          local ret = ""

          if entry.noremap ~= 0 then
            ret = ret .. "*"
          end

          if entry.buffer ~= 0 then
            ret = ret .. "@"
          end

          return ret
        end

        return function(entry)
          local desc = get_desc(entry)
          local lhs = get_lhs(entry)
          local icon, icon_hl = unpack(mode_icons[entry.mode] or { "", "TelescopeKeymapModeOther" })

          return make_entry.set_default_entry_mt({
            mode = entry.mode,
            lhs = lhs,
            desc = desc,
            value = entry,
            ordinal = entry.mode .. " " .. lhs .. " " .. desc,
            display = function()
              return displayer({
                { icon, icon_hl },
                { string.upper(entry.mode), "TelescopeKeymapModeTag" },
                { lhs, "TelescopeKeymapLhs" },
                { get_attr(entry), "TelescopeKeymapMeta" },
                { desc, "TelescopeKeymapDesc" },
              })
            end,
          }, opts)
        end
      end

      telescope.setup({
        defaults = {
          prompt_prefix = " 󰍉  ",
          selection_caret = "  ",
          entry_prefix = "  ",
          sorting_strategy = "ascending",
          layout_strategy = "flex",
          layout_config = {
            prompt_position = "top",
            horizontal = {
              preview_width = 0.55,
            },
            width = 0.9,
            height = 0.82,
          },
          winblend = 0,
        },
        pickers = {
          keymaps = themes.get_dropdown({
            prompt_title = "Keymaps",
            previewer = false,
            layout_config = {
              width = 0.72,
              height = 0.72,
            },
          }),
        },
        extensions = {
          ["ui-select"] = themes.get_dropdown({
            previewer = false,
            layout_config = {
              width = 0.5,
              height = 0.35,
            },
          }),
        },
      })

      pcall(telescope.load_extension, "fzf")
      telescope.load_extension("ui-select")

      vim.keymap.set("n", "<C-p>", function()
        builtin.find_files(themes.get_dropdown({
          previewer = false,
          layout_config = {
            width = 0.7,
            height = 0.72,
          },
        }))
      end, { desc = "Find Files" })

      vim.keymap.set("n", "<leader>fk", function()
        local opts = themes.get_dropdown({
          prompt_title = "Keymaps",
          previewer = false,
          layout_config = {
            width = 0.72,
            height = 0.72,
          },
        })

        opts.entry_maker = keymap_entry_maker(opts)
        builtin.keymaps(opts)
      end, { desc = "Search Keymaps" })

      vim.keymap.set("n", "<leader>fg", function()
        builtin.live_grep(themes.get_dropdown({
          previewer = false,
          layout_config = {
            width = 0.82,
            height = 0.78,
          },
        }))
      end, { desc = "Search Project Text" })
    end,
  },
}
