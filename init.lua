-- Bootstrap lazy.nvim
if vim.fn.has("nvim-0.9.4") == 0 then
  vim.api.nvim_err_writeln("This config requires Neovim >= 0.9.4. Please upgrade Neovim on this machine.")
  return
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

