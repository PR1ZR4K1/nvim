return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local conf = {
        options = {
          theme = 'catppuccin',
          icons_enabled = true,
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = false,
          globalstatus = true,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {
            'branch',
            {
              'filename',
              newfile_status = true,
              path = 1,
              symbols = {
                modified = '●',
                readonly = '',
                newfile  = '󱙄',
                unnamed  = ''
              }
            }
          },
          lualine_c = {'diff', 'diagnostics'},
          lualine_x = {
            -- include auto session name here
            {
              function()
                return require("auto-session.lib").current_session_name(true)
              end,
              color = "LualineSessionName",
              separator = { right = "◀" },
            },
            {
              'fileformat',
              separator = { right = "◀" },
            },
            'filetype'
          },
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {
            {
              'filename',
              newfile_status = true,
              path = 1,
              symbols = {
                modified = '●',
                readonly = '',
                newfile  = '󱙄',
                unnamed  = ''
              }
            }
          },
          lualine_c = {},
          lualine_x = {},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
      require("lualine").setup(conf)
    end
}
