return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			integrations = {
				cmp = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
		vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#cba6f7", bg = "#1e1e2e" })
		vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#1e1e2e" })
	end,
}
