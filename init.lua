-- Bootstrap lazy.nvim
if vim.fn.has("nvim-0.9.4") == 0 then
  vim.api.nvim_err_writeln("This config requires Neovim >= 0.9.4. Please upgrade Neovim on this machine.")
  return
end

-- Disable netrw so opening directories does not spawn the built-in browser.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- If Neovim is launched with a single directory argument, make that directory
-- the actual working directory so cwd-based plugins (Telescope, Neo-tree,
-- sessions, etc.) all agree on the root context.
if vim.fn.argc() == 1 then
  local launch_arg = vim.fn.argv(0)
  if vim.fn.isdirectory(launch_arg) == 1 then
    vim.g.startup_dir_arg = vim.fn.fnamemodify(launch_arg, ":p")
    vim.cmd.cd(vim.fn.fnameescape(vim.g.startup_dir_arg))
  end
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo(true, {
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lsp-keymaps")
require("vim-options")
require("nvim-keymaps")

require("lazy").setup("plugins")

if vim.g.startup_dir_arg then
  local startup_group = vim.api.nvim_create_augroup("UserStartupDirectory", { clear = true })
  vim.api.nvim_create_autocmd("VimEnter", {
    group = startup_group,
    once = true,
    callback = function()
      if vim.v.this_session ~= "" then
        return
      end

      local current_buf = vim.api.nvim_get_current_buf()
      local current_name = vim.api.nvim_buf_get_name(current_buf)

      if current_name == "" or vim.fn.isdirectory(current_name) ~= 1 then
        return
      end

      local opened_alpha = pcall(vim.cmd, "Alpha")
      if not opened_alpha then
        vim.cmd.enew()
      end

      if vim.api.nvim_get_current_buf() ~= current_buf then
        pcall(vim.api.nvim_buf_delete, current_buf, { force = true })
      end
    end,
  })
end
